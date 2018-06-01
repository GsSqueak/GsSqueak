examples
colorfulBasicometer
	"set up as a forwards type display, ie 1 to left, +1 to right"
	"RotaryDialMorph new colorfulBasicometer openInWorld"
	| pointerMorph textM |
	self startAngle: -120 stopAngle: 120;
		startValue: -1 stopValue: 1.
	self extent: 300@300;
		color: GradientFillStyle sample.
	dialCenter := self center.

	self addMorph: (textM := TextMorph fancyPrototype).
	textM extent: 250@30; contents: 'Wild colored RotaryDial HippieLand!'; fontName: 'Darkmap DejuVu Sans' size: 22.
	textM align: textM topCenter with:  self topCenter.
	pointerMorph := CurveMorph new vertices: {0@0. -10@ -50. 10@ -100} color: Color yellow borderWidth: 5 borderColor: Color blue.
	pointerMorph makeOpen; makeForwardArrow..
 	pointerMorph bottomRight: 0@0.
	needleMorph := TransformationMorph new position: dialCenter; addMorph: pointerMorph.
	self addMorph: needleMorph.
	self inputValue: 0


	