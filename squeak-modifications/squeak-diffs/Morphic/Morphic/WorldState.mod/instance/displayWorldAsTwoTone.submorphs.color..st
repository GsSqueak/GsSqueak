*Morphic-MorphicExtras-update cycle
displayWorldAsTwoTone: aWorld submorphs: submorphs color: color
	"Display the world in living black-and-white. (This is typically done to save space.)"

	| f |
	f := ColorForm extent: aWorld viewBox extent depth: 1.
	f colors: (Array with: color dominantColor with: Color black).
	self canvas: f getCanvas.

	"force the entire canvas to be redrawn"
	aWorld fullRepaintNeeded.
	self drawWorld: aWorld submorphs: submorphs invalidAreasOn: canvas.  "redraw on offscreen canvas"
	canvas showAt: aWorld viewBox origin.  "copy redrawn areas to Display"
	Display forceDisplayUpdate.
	self canvas: nil.  "forget my canvas to save space"
