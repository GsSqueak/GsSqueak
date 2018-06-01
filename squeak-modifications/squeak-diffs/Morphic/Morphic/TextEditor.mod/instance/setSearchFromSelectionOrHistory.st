accessing
setSearchFromSelectionOrHistory
	"Updates the current string to find with the current selection or the last change if it replaced something and thus had a prior selection."

	self hasSelection
		ifTrue: [FindText := self selection]
		ifFalse: [self history hasReplacedSomething
			ifTrue: [FindText := self history previous contentsBefore]
			ifFalse: [(self history hasInsertedSomething and: [(self history hasCursorMoved: self stopIndex) not])
				ifTrue: [
					FindText := self history previous contentsAfter.
					self removePreviousInsertion. "Undoable."]]]