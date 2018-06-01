examples
upsidedownometer
	"set up as a forwards but upside-down type display, ie 1 to left, +1 to right"
	"RotaryDialMorph new upsidedownometer openInWorld"
	| pointerMorph |
	self startAngle: 100 stopAngle: -100;
		startValue: -1 stopValue: 1.
	self extent: 200@200;
		color: Color transparent.
	dialCenter := self center.

	self addMorph: (CircleMorph new extent: self extent).
	pointerMorph := LineMorph from: 0@0 to: 0@ (self height // 2) color: Color red width: 2.
 	pointerMorph bottomRight: 0@0.
	needleMorph := TransformationMorph new position: dialCenter; addMorph: pointerMorph.
	self addMorph: needleMorph.
	self inputValue: 0


	