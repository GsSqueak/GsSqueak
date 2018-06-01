menu
setMagnification: evt
	| menu |
	menu := MenuMorph new.
	((1 to: 8), #(16 24 32)) do: [:w |
		menu add: w printString
			target: self
			selector: #magnification:
			argumentList: (Array with: w).
		magnification = w ifTrue: [menu lastSubmorph color: Color red]].
	menu popUpEvent: evt in: self world