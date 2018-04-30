color from user
fromUser
	"Displays a color palette of colors, waits for a mouse click, and returns the selected color. Any pixel on the Display can be chosen, not just those in the color palette."
	"Note: Since the color chart is cached, you may need to do 'ColorChart := nil' after changing the oldColorPaletteForDepth:extent: method."
	"Color fromUser"

	| d startPt save tr oldColor c here s |
	d := Display depth.
	((ColorChart == nil) or: [ColorChart depth ~= Display depth]) 
		ifTrue: [ColorChart := self oldColorPaletteForDepth: d extent: (2 * 144)@80].
	Sensor cursorPoint y < Display center y 
		ifTrue: [startPt := 0@(Display boundingBox bottom - ColorChart height)]
		ifFalse: [startPt := 0@0].

	save := Form fromDisplay: (startPt extent: ColorChart extent).
	ColorChart displayAt: startPt.
	tr := ColorChart extent - (50@19) corner: ColorChart extent.
	tr := tr translateBy: startPt.

	oldColor := nil.
	[Sensor anyButtonPressed] whileFalse: [
		c := Display colorAt: (here := Sensor cursorPoint).
		(tr containsPoint: here)
			ifFalse: [Display fill: (0@61+startPt extent: 20@19) fillColor: c]
			ifTrue: [
				c := Color transparent.
				Display fill: (0@61+startPt extent: 20@19) fillColor: Color white].
		c = oldColor ifFalse: [
			Display fillWhite: (20@61 + startPt extent: 135@19).
			c isTransparent
				ifTrue: [s := 'transparent']
				ifFalse: [s := c shortPrintString.
						s := s copyFrom: 7 to: s size - 1].
			s displayAt: 20@61 + startPt.
			oldColor := c]].
	save displayAt: startPt.
	Sensor waitNoButton.
	^ c
