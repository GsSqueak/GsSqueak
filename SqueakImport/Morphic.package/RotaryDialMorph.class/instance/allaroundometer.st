examples
allaroundometer
	"set up as an all-round type display like a clock or compass"
	"RotaryDialMorph new allaroundometer openInWorld"
	| pointerMorph |
	self startAngle: 0 stopAngle: 360;
		startValue: 0 stopValue: 1.
	self extent: 200@200;
		color: Color transparent.
	dialCenter := self center.
	self addMorph: (CircleMorph new extent: self extent).
	pointerMorph := LineMorph from: 0@0 to: 0@ (self height // 2) color: Color red width: 2.
 	pointerMorph bottomRight: 0@0.
	needleMorph := TransformationMorph new position: dialCenter; addMorph: pointerMorph.
	self addMorph: needleMorph.
	self inputValue: 0.25

	