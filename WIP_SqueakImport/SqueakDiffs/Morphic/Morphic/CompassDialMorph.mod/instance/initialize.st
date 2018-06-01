initialize-release
initialize
	"assemble a nice compass morph. The background is an ImageMorph with scale/dial drawn with code adapted from a generous donation of time and effort by Bob Arning; similarly for the needle"
	| pointerMorph |

	super initialize.
	"A compass runs from 0 deg to 360, clockwise. Traditional compass roses can be very ornate."

	self startAngle: 0 stopAngle: 360;
			startValue: 0 stopValue: 360.
	self extent: 200@200; color: Color transparent; borderWidth: 0.
	dialCenter := self center.

	"build the dial background. This is amazingly complex to think about programmatically; this example is fairly hard-coded by hand but somebody out there almost certainly has ideas about parameterizing this to amke a nice general utility"
	self buildDial.

	"build our fancy needle as an ImageMorph, set the position to horizontal centre and about 2/3 down so that it rotates about that point when inside the TransformationMorph"
	pointerMorph := self basicNeedleOfLength: (self height * 0.65) rounded width: 10 color: Color red.
 	pointerMorph position: pointerMorph extent * ( -0.5@ -0.5).

	"we keep track of the TransformationMorph since that is what we have to rotate as the incoming pressure values change"
	needleMorph := TransformationMorph new position: dialCenter; addMorph: pointerMorph.
	self addMorph: needleMorph.
		
	"add a central colored dot. Because we just do."
	self addMorph: (CircleMorph new extent: 20@20; color: Color red twiceDarker; center: dialCenter)
	