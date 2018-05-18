StandardFileMenu
startUpWithCaption: captionOrNil
	"Display the menu, slightly offset from the cursor,
	so that a slight tweak is required to confirm any action."
	^ self startUpWithCaption: captionOrNil at: (ActiveHand ifNil:[Sensor cursorPoint]).