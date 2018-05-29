examples
vumeter
	"set up as a VU meter type display"
	"RotaryDialMorph new vumeter openInWorld"
	| pointerMorph |
	self startAngle: 35 stopAngle: 145;
			startValue: -10 stopValue: 10.
	self extent: 100@200.
	dialCenter := -60@100.
	pointerMorph := RectangleMorph new extent: 4@150; color: Color black; bottomRight: 0@0.
	needleMorph := TransformationMorph new position: dialCenter; addMorph: pointerMorph.
	self addMorph: needleMorph.
	self addMorph: (CircleMorph new extent:  200@200; center: dialCenter).
	self inputValue: 0.
	self color: Color white; borderWidth: 3; borderColor: Color black; clipSubmorphs: true
	
	