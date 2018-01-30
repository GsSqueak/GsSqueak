groups of shades
wheel: thisMany 
	"An array of thisMany colors around the color wheel starting at self and
	ending all the way around the hue space just before self. Array is of
	length thisMany. Very useful for displaying color based on a variable in
	your program. "
	| _gsSqueakTemp_sat _gsSqueakTemp_bri _gsSqueakTemp_step _gsSqueakTemp_hue |
	_gsSqueakTemp_sat := self saturation.
	_gsSqueakTemp_bri := self brightness.
	_gsSqueakTemp_hue := self hue.
	_gsSqueakTemp_step := 360.0
				/ (thisMany max: 1).
	^ (1 to: thisMany)
		collect: [:num | 
			| c |
			c := Color
						h: _gsSqueakTemp_hue
						s: _gsSqueakTemp_sat
						v: _gsSqueakTemp_bri.
			"hue is taken mod 360"
			_gsSqueakTemp_hue := _gsSqueakTemp_hue + _gsSqueakTemp_step.
			c]"
	(Color wheel: 8) withIndexDo: [:c :i | Display fill: (i*10@20 extent:
	10@20) fillColor: c
	"