menu
chooseDenominator: evt
	| menu |
	menu := MenuMorph new.
	(Integer primesUpTo: 30) do:
		[:i |
		menu add: i printString
			target: self selector: #setDenominator:
			argument: i].
	menu addLine.
	menu add: 'none' target: self selector: #setDenominator: argument: 9999.
	menu popUpEvent: evt in: self world