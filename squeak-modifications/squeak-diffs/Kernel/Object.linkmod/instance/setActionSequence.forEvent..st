*System-Object Events-accessing
setActionSequence: actionSequence
forEvent: anEventSelector

	| action |
	"This is a good time to compact the action sequence of old, garbage collected stuff."
	action := actionSequence asMinimalRepresentation.
	action
		ifNil: [ self removeActionsForEvent: anEventSelector]
		ifNotNil: [
			self updateableActionMap
				at: anEventSelector asSymbol
				put: action]