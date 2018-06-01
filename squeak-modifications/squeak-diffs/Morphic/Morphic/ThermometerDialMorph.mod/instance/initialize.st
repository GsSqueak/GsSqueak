initialize-release
initialize
	"Build a thermometer. The background is an ImageMorph showing a dial derived from the same general principles as the BarometerMorph. 
	The temperature scale is fixed for now at -5C to 30C but ought to be parameterised someday. We'll have the Celcius scale as the inner and a conversion to Fahrenheit as the outer"
	| pointerMorph |
	super initialize.
	
	self startAngle: -140 stopAngle: 140;
		startValue: -10 stopValue: 35.
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
