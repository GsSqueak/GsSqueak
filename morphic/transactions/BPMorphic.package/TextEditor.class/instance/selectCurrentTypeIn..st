nonediting/nontyping keys
selectCurrentTypeIn: aKeyboardEvent 
	"Select what would be replaced by an undo (e.g., the last typeIn)."
	| _gsSqueakTemp_prior |
	self flag: #buggy.
	self insertAndCloseTypeIn.
	_gsSqueakTemp_prior := otherInterval.
	self insertAndCloseTypeIn.
	otherInterval := _gsSqueakTemp_prior.
	^ true