initialize-release
initialize
	"assemble a nice barometer morph. The background is an ImageMorph with scale/dial drawn with code adapted from a generous donation of time and effort by Bob Arning; similarly for the needle"
	| pointerMorph |

	super initialize.
	"set up as a barometer type display; running clockwise with increasing values.
	A decent range for a barometer is 950mB to 1050mB; it covers most plausible weather and matches decently with an additional inches-of-Hg scale going from 28 to 31.
	28in. -> 948mB and 31in. -> 1050 (to enough accuracy for a screen based widget) so we need a small tweak at the lower end of the dial. If we aim initially for 150deg each side of north we have 3deg per milliBar; to accomodate the extra 2mB we can add 6deg at the low end, which makes 1000mB sit nicely at due north.
	So we will use angles of -156 to 150 and values of 948 to 1050 as our limits."

	self startAngle: -156 stopAngle: 150;
			startValue: 948 stopValue: 1050.
	self extent: 200@200; color: Color transparent; borderWidth: 0.
	dialCenter := self center.

	"build the dial background. This is amazingly complex to think about programmatically; this example is fairly hard-coded by hand but somebody out there almost certainly has ideas about parameterizing this to amke a nice general utility"
	self buildDial.

	"build our fancy needle as an ImageMorph, set the position to horizontal centre and about 2/3 down so that it rotates about that point when inside the TransformationMorph"
	pointerMorph := self fancyNeedleOfLength: (self height * 0.65) rounded.
 	pointerMorph position: pointerMorph extent * ( -0.5@ -0.65).

	"we keep track of the TransformationMorph since that is what we have to rotate as the incoming pressure values change"
	needleMorph := TransformationMorph new position: dialCenter; addMorph: pointerMorph.
	self addMorph: needleMorph.
	
	"Add the simpler needle used to indicate the prior 'remembered' reading; we will make a click update it to the current value"
	pointerMorph := self simpleNeedleOfLength: (self height * 0.35) rounded color: (Color r: 16rFF g: 16rD7 b: 16r0 range: 512).
 	pointerMorph position: pointerMorph extent * ( -0.5@ -1).
	priorPressureIndicator :=  TransformationMorph new position: dialCenter; addMorph: pointerMorph.
	self addMorph: priorPressureIndicator.
	
	"add a central near-to-gold colored dot. Because we just do."
	self addMorph: (CircleMorph new extent: 20@20; color: (Color r: 16rFF g: 16rD7 b: 16r0 range: 256); center: dialCenter)
	