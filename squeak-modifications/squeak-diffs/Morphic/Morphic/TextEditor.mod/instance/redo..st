editing keys
redo: aKeyboardEvent 
	"Redo the last edit."

	self insertAndCloseTypeIn.
	self redo.
	^true