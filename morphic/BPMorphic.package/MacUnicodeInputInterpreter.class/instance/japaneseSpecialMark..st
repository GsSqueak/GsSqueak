conversion
japaneseSpecialMark: anInteger 
	"For japanese special marks.
	This method converts 'YEN SIGN' (16rA5) to 'REVERSE SOLIDUS'
	(16r5C) and use Japanese leading characters instead of Unicode for
	below characters.
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
		ifTrue: [anInteger = 165
				ifTrue: [^ Character value: 92].
			(#(162 163 167 168 172 176 177 180 182 215 247 ) includes: anInteger)
				ifTrue: [^ Character leadingChar: JapaneseEnvironment leadingChar code: anInteger]].
	^ nil