editing keys
undo: aKeyboardEvent 
	"Undo the last edit."
	self insertAndCloseTypeIn.
	self undo.
	^ true