examples
showColors: colorList 
	"Display the given collection of colors across the top of the Display."
	| _gsSqueakTemp_w _gsSqueakTemp_r |
	_gsSqueakTemp_w := Display width // colorList size.
	_gsSqueakTemp_r := 0 @ 0 extent: _gsSqueakTemp_w
					@ ((_gsSqueakTemp_w min: 30)
							max: 10).
	colorList
		do: [:c | 
			Display fill: _gsSqueakTemp_r fillColor: c.
			_gsSqueakTemp_r := _gsSqueakTemp_r translateBy: _gsSqueakTemp_w @ 0]