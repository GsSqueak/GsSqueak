events
mouseUp: evt
	"An attempt to break up the old processRedButton code into threee phases"

	oldInterval ifNil: [^ self].  "Patched during clickAt: repair"
	(self hasCaret 
		and: [oldInterval = self selectionInterval])
		ifTrue: [self selectWord].
	self setEmphasisHere.
	(self isDisjointFrom: oldInterval) ifTrue:
		[otherInterval := oldInterval].
	self storeSelectionInParagraph.

	self updateCursorForEvent: evt.
	morph removeProperty: #waitingForTextDrag.