geometry
minWidth
	"The minimum extent is that of 2 or 3 buttons in a row or column,
	the 'up' and 'down' button and optionally the 'menu' button."

	| buttonCount refExtent refBorder |
	refExtent := upButton minExtent.
	refBorder := upButton borderWidth.
	buttonCount := {
		upButton visible.
		downButton visible.
		self menuButton visible. } count: [:ea | ea].
	^ self orientation == #horizontal
		ifTrue: [super minWidth max: ((buttonCount * refExtent x) - (buttonCount-1 * refBorder))]
		ifFalse: [super minWidth max: 5]