actions
plainCursor: aCursor event: anEvent
	"Set the cursor to use with this painting action/tool. Offset of the form must be set."

	currentCursor := aCursor.
	anEvent hand showTemporaryCursor: aCursor.
	self notifyWeakDependentsWith: {#currentCursor. anEvent. currentCursor}.