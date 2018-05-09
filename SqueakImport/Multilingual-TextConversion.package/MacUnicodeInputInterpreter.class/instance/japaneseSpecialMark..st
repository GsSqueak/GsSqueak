conversion
japaneseSpecialMark: anInteger 
	"For japanese special marks.
	This method converts 'YEN SIGN' (16rA5) to 'REVERSE SOLIDUS' (16r5C)
	and use Japanese leading characters instead of Unicode for below
	characters.
	'CENT SIGN' (16rA2)
	'POUND SIGN' (16rA3)
	'SECTION SIGN' (16rA7)
	'DIAERESIS' (16rA8)
	'NOT SIGN' (16rAC)
	'DEGREE SIGN' (16rB0)
	'PLUS-MINUS SIGN (16rB1)
	'ACUTE ACCENT' (16rB4)
	'PILCROW SIGN' (16rB6)
	'MULTIPLICATION SIGN' (16rD7)
	'DIVISION SIGN' (16rF7)
	"
	Project current localeID
			= (LocaleID isoLanguage: 'ja')
		ifTrue: [anInteger = 16rA5
				ifTrue: [^ Character value: 16r5C].
			(#(16rA2 16rA3 16rA7 16rA8 16rAC 16rB0 16rB1 16rB4 16rB6 16rD7 16rF7) includes: anInteger)
				ifTrue: [^ Character leadingChar: JapaneseEnvironment leadingChar code: anInteger]].
	^ nil