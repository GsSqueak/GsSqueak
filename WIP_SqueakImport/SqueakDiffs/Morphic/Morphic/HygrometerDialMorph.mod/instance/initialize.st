initialize-release
initialize
	"Build a hygrometer. The background is an ImageMorph showing a dial derived from the same general principles as the BarometerMorph. "
	| pointerMorph |
	super initialize.
	
	self startAngle: -140 stopAngle: 140;
		startValue: 0 stopValue: 100.
	self extent: 200@200; color: Color transparent; borderWidth: 0.
	dialCenter := self center.
	
	self buildDial.

	"build our fancy needle as an ImageMorph, set the position to horizontal centre and about 2/3 down so that it rotates about that point when inside the TransformationMorph"
	pointerMorph := self fancyNeedleOfLength: (self height * 0.65) rounded.
 	pointerMorph position: pointerMorph extent * ( -0.5@ -0.65).

	"we keep track of the TransformationMorph since that is what we have to rotate as the incoming pressure values change"
	needleMorph := TransformationMorph new position: dialCenter; addMorph: pointerMorph.
	self addMorph: needleMorph.

	"add a central colored dot. Because we just do."
	self addMorph: (CircleMorph new extent: 20@20; color: Color black; center: dialCenter)
