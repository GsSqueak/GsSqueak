basic control sequence
startUpWithCaption: captionOrNil icon: aForm
	"Display the menu, slightly offset from the cursor,
	so that a slight tweak is required to confirm any action."
	^ self
			startUpWithCaption: captionOrNil
			icon: aForm
			at: (ActiveHand ifNil:[Sensor]) cursorPoint
