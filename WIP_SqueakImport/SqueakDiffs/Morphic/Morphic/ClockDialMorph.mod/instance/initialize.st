initialization
initialize
	"assemble a nice clock morph. The background is an ImageMorph with scale/dial drawn with code adapted from a generous donation of time and effort by Bob Arning; the minute needle is the inherited needleMorph and we added a new hourHandMorph. Both are simple rectangleMorphs"
	| pointerMorph |

	super initialize.

	self startAngle: 0 stopAngle: 360;
			startValue: 0 stopValue: 360.
	self extent: 200@200; color: Color transparent; borderWidth: 0.
	dialCenter := self center.

	"build the dial background; basic clock with miute ticks and hour long-ticks + arabic numerals"
	self buildDial.

	pointerMorph := self basicNeedleOfLength: (self height * 0.45) rounded width: 4 color: Color red.
 	pointerMorph position: pointerMorph extent * ( -0.5@ -1).

	"we keep track of the TransformationMorph since that is what we have to rotate"
	needleMorph := TransformationMorph new position: dialCenter; addMorph: pointerMorph.
	self addMorph: needleMorph.

	"additional neelde for the hours"
	pointerMorph := self basicNeedleOfLength: (self height * 0.35) rounded width: 6 color: Color black.
 	pointerMorph position: pointerMorph extent * ( -0.5@ -1).

	"we keep track of the TransformationMorph since that is what we have to rotate"
	hourHandMorph := TransformationMorph new position: dialCenter; addMorph: pointerMorph.
	self addMorph: hourHandMorph.
		
	"add a central colored dot. Because we just do."
	self addMorph: (CircleMorph new extent: 8@8; color: Color red twiceDarker; center: dialCenter)
	