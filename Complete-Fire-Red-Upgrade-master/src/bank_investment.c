#include "defines.h"
#include "../include/event_data.h"
#include "../include/money.h"
#include "../include/random.h"
#include "../include/string_util.h"
#include "../include/constants/game_stat.h"

#include "../include/new/bank_investment.h"
/*
bank_investment.c
	the Poke-Exchange investment (Sig. Dallors, Stellavia, map 10.8). The money's value changes once per
	"market day" (INVESTMENT_DAY_STEPS steps walked), by an amount drawn from the plan the player chose.
	Each day's change comes from a seed picked when investing, so the value only depends on how far the
	player has walked: asking again doesn't roll anything new.

	Script use (callasm):
		Investment_Start: Var8000 = plan (0 Prudente, 1 Bilanciato, 2 Speculativo), Var8001 = amount
		                  (0 = 5000, 1 = 10000, 2 = 20000). Takes the money and starts the investment.
		                  LastResult = 1 if it did, 0 if the player can't afford it.
		Investment_Check: buffers the current value in [BUFFER1] and the gain or loss in percent in
		                  [BUFFER2]. LastResult = 0 loss, 1 gain, 2 unchanged, 3 no market day yet.
		Investment_Withdraw: gives the player the current value.
*/

#define INVESTMENT_DAY_STEPS 500 //Steps walked per market day
#define INVESTMENT_MAX_DAYS 1000 //Market days counted at most (500,000 steps), so the loop stays short
#define VAR_INVESTMENT_PLAN 0x5030
#define VAR_INVESTMENT_SEED 0x5031
#define VAR_INVESTMENT_STEPS_LO 0x5032 //Step counter when the money was invested
#define VAR_INVESTMENT_STEPS_HI 0x5033
#define VAR_INVESTMENT_AMOUNT 0x5034 //Money invested

u32 __attribute__((long_call)) GetGameStat(u8 index);

struct InvestmentPlan
{
	s8 minChange; //Percent per market day
	s8 maxChange;
	s16 minTotal; //Percent of the invested amount the value never goes under...
	s16 maxTotal; //...or over
};

static const struct InvestmentPlan sInvestmentPlans[] =
{
	{  1,  1,   0,  25}, //Prudente: +1% every market day, up to +25%
	{ -5,  8, -50, 100}, //Bilanciato: -5% to +8% (+1.5% on average), between -50% and +100%
	{-14, 20, -80, 200}, //Speculativo: -14% to +20% (+3% on average), between -80% and +200%
};

static const u16 sInvestmentAmounts[] = {5000, 10000, 20000};

//Investments made before this system (old saves) have no amount stored: they were always 5000
static u32 GetInvestedAmount(void)
{
	u32 amount = VarGet(VAR_INVESTMENT_AMOUNT);
	return (amount != 0) ? amount : sInvestmentAmounts[0];
}

static u32 GetStepsWalked(void)
{
	u32 now = GetGameStat(GAME_STAT_STEPS);
	u32 then = VarGet(VAR_INVESTMENT_STEPS_LO) | (VarGet(VAR_INVESTMENT_STEPS_HI) << 16);
	return now - then;
}

//The same seed and day always give the same number
static u32 DayRandom(u16 seed, u32 day)
{
	u32 x = seed * 0x9E3779B1 + day * 0x85EBCA6B + 1;
	x ^= x >> 15;
	x *= 0x2C1B3C6D;
	x ^= x >> 12;
	x *= 0x297A2D39;
	x ^= x >> 15;
	return x;
}

static u32 GetInvestmentValue(void)
{
	u8 planId = VarGet(VAR_INVESTMENT_PLAN);
	const struct InvestmentPlan* plan = &sInvestmentPlans[planId < ARRAY_COUNT(sInvestmentPlans) ? planId : 0];
	u16 seed = VarGet(VAR_INVESTMENT_SEED);
	u32 days = GetStepsWalked() / INVESTMENT_DAY_STEPS;
	u32 amount = GetInvestedAmount();
	u32 min = amount * (100 + plan->minTotal) / 100;
	u32 max = amount * (100 + plan->maxTotal) / 100;
	u32 range = plan->maxChange - plan->minChange + 1;
	u32 value = amount;

	if (days > INVESTMENT_MAX_DAYS)
		days = INVESTMENT_MAX_DAYS;

	for (u32 day = 0; day < days; ++day)
	{
		s32 change = plan->minChange + (s32) (DayRandom(seed, day) % range);
		value = value * (100 + change) / 100;

		if (value < min)
			value = min;
		else if (value > max)
			value = max;
	}

	return value;
}

void Investment_Start(void)
{
	u32 steps = GetGameStat(GAME_STAT_STEPS);
	u16 amount = sInvestmentAmounts[Var8001 < ARRAY_COUNT(sInvestmentAmounts) ? Var8001 : 0];

	if (!IsEnoughMoney(&gSaveBlock1->money, amount))
	{
		gSpecialVar_LastResult = FALSE;
		return;
	}

	RemoveMoney(&gSaveBlock1->money, amount);
	VarSet(VAR_INVESTMENT_AMOUNT, amount);
	VarSet(VAR_INVESTMENT_PLAN, Var8000);
	VarSet(VAR_INVESTMENT_SEED, Random());
	VarSet(VAR_INVESTMENT_STEPS_LO, steps & 0xFFFF);
	VarSet(VAR_INVESTMENT_STEPS_HI, steps >> 16);
	gSpecialVar_LastResult = TRUE;
}

void Investment_Check(void)
{
	u32 value = GetInvestmentValue();
	u32 amount = GetInvestedAmount();
	u32 diff = (value >= amount) ? value - amount : amount - value;
	u32 percent = (diff * 100 + amount / 2) / amount; //Rounded

	ConvertIntToDecimalStringN(gStringVar1, value, STR_CONV_MODE_LEFT_ALIGN, 7);
	ConvertIntToDecimalStringN(gStringVar2, percent, STR_CONV_MODE_LEFT_ALIGN, 3);

	if (GetStepsWalked() < INVESTMENT_DAY_STEPS)
		gSpecialVar_LastResult = 3;
	else if (value < amount)
		gSpecialVar_LastResult = 0;
	else if (value > amount)
		gSpecialVar_LastResult = 1;
	else
		gSpecialVar_LastResult = 2;
}

void Investment_Withdraw(void)
{
	AddMoney(&gSaveBlock1->money, GetInvestmentValue());
}
