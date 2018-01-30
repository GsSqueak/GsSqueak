testing
test2
	"BitBltSimulation test2"
	| _gsSqueakTemp_f |
	Display
		fillWhite: (0 @ 0 extent: 300 @ 140).
	1
		to: 12
		do: [:i | 
			_gsSqueakTemp_f := (Form extent: i @ 5) fillBlack.
			0
				to: 20
				do: [:x | _gsSqueakTemp_f displayOn: Display at: x * 13 @ (i * 10)]]