tablet drawing examples
testTabletTracking
	"A very simple example of drawing using the pen of a digitizing tablet such as a Wacom ArtZ tablet. This requires the optional tablet support primitives which may not be supported on all platforms. Compare the tracking speed of this example with that of testMouseTracking. On a Macintosh, the tablet primitives provide roughly 120 samples/second versus only 60 mouse samples/second, and the difference is noticable. Works best in full screen mode. Mouse down to draw a stroke, shift-mouse to exit." 
	"Pen testTabletTracking"

	| tabletScale pen |
	tabletScale := self tabletScaleFactor.
	pen := Pen newOnForm: Display.
	pen roundNib: 8.
	pen color: Color black.
	Display fillColor: Color white.
	Display restoreAfter: [ | p |
		[Sensor shiftPressed and: [Sensor anyButtonPressed]] whileFalse: [
			p := (Sensor tabletPoint * tabletScale) rounded.
		     Sensor tabletPressure > 0
				ifTrue: [pen goto: p]
				ifFalse: [
					pen color: Color random.
					pen place: p]]].
