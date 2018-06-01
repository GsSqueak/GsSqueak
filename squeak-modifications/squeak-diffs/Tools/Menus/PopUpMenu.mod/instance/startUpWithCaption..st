basic control sequence
startUpWithCaption: captionOrNil
	"Display the menu, slightly offset from the cursor,
	so that a slight tweak is required to confirm any action."
	self flag: #fix. "mt: Could we manage to open pop-up menus in Morphic without accessing ActiveHand?"
	^ self startUpWithCaption: captionOrNil at: (ActiveHand ifNil:[Sensor]) cursorPoint