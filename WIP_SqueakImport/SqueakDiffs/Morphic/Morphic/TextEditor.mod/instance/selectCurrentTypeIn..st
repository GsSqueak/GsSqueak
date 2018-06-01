nonediting/nontyping keys
selectCurrentTypeIn: aKeyboardEvent 
	"Select what would be replaced by an undo (e.g., the last typeIn)."

	| prior |

	self flag: #buggy.
	self insertAndCloseTypeIn.
	prior := otherInterval.
	self insertAndCloseTypeIn.
	otherInterval := prior.
	^ true