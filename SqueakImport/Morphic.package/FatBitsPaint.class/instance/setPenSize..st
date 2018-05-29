menu
setPenSize: evt
	| menu sizes |
 
	menu := MenuMorph new.
	sizes := (1 to: 5), (6 to: 12 by: 2), (15 to: 40 by: 5).
	sizes do: [:w |
		menu add: w printString
			target: self
			selector: #penSize:
			argumentList: (Array with: w).
		(brushSize // magnification) = w ifTrue: [menu lastSubmorph color: Color red]].
	menu popUpEvent: evt in: self world