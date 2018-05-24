events
deactivate: evt

	"If a stand-alone menu, just delete it"
	popUpOwner ifNil: [ 
		self deleteIfPopUp: evt.
		^true ].
	"If a sub-menu, then deselect, and return focus to outer menu"
	self selectItem: nil event: evt.
	evt hand newMouseFocus: popUpOwner owner.
	evt hand newKeyboardFocus: popUpOwner owner