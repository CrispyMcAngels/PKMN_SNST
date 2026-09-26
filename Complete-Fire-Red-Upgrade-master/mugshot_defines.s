@ Character portraits for overworld scripts.
@
@ Usage in a script:
@	show_mugshot CRISPY
@ which is the same as:
@	showpokepic 0x3B4 0x0 0x6
@
@ To add a character, add a line ".equ MUGSHOT_<NAME>, <portrait id>" below,
@ then use "show_mugshot <NAME>" in the scripts.

.equ MUGSHOT_CRONO,			0x3AB
.equ MUGSHOT_UNKNOWN_MAN,	0x3AC
.equ MUGSHOT_VESPER,		0x3AD
.equ MUGSHOT_MAMMA,			0x3B3
.equ MUGSHOT_CRISPY,		0x3B4
.equ MUGSHOT_NAOMI,			0x3B5
.equ MUGSHOT_PLAYER,		0x3B6
.equ MUGSHOT_PROFKRAEMER,	0x3B7
.equ MUGSHOT_FILIBERTO,		0x3B8
.equ MUGSHOT_UNKNOWN_MAN_2,	0x3B9
.equ MUGSHOT_RAITO,			0x3BA
.equ MUGSHOT_DUSK_GRUNT_M,	0x3BB
.equ MUGSHOT_DUSK_GRUNT_F,	0x3BC
.equ MUGSHOT_UMBRA,			0x3BD
.equ MUGSHOT_ELEONORA,		0x3C0
.equ MUGSHOT_ERIS,			0x3C1
.equ MUGSHOT_RAITO_SHADOW,	0x3C2
.equ MUGSHOT_MYRYAM,		0x3C7
.equ MUGSHOT_OLD_CRISPY,	0x3C8
.equ MUGSHOT_LIO,			0x3C9
.equ MUGSHOT_SAGGIO_DF,		0x3CA

@ Shows a character portrait in the standard position (bottom left, above the text box)
.macro show_mugshot name:req
	showpokepic MUGSHOT_\name, 0x0, 0x6
.endm
