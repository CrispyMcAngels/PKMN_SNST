.text
.thumb
.align 2

@ Weather 15 = forest light (src/forest_light.c).
@ When a weather is saved (map headers, setweather), TranslateWeatherNum (0x807B1CC) jumps through a table
@ at 0x807B1E4 and returns WEATHER_NONE for anything it doesn't know, including 15. repoints makes entry 15
@ (0x807B220) jump here instead. Reached with mov pc (still Thumb), after the function's push {lr}.
.global TranslateWeatherNum_ForestLight
TranslateWeatherNum_ForestLight:
	mov r0, #15
	pop {r1}
	bx r1
