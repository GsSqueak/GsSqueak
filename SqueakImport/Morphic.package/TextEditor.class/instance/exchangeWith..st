private
exchangeWith: prior
	"If the prior selection is non-overlapping and legal, exchange the text of
	 it with the current selection and leave the currently selected text selected
	 in the location of the prior selection (or leave a caret after a non-caret if it was
	 exchanged with a caret).  If both selections are carets, flash & do nothing.
	 Don't affect the paste buffer."

	| start stop before selection priorSelection delta altInterval |
	start := self startIndex.
	stop := self stopIndex - 1.
	
	(((prior first <= prior last) and: [start <= stop])
		and: [self isDisjointFrom: prior])
			ifFalse: [morph flash. ^ self].
		
	before := prior last < start.
	selection := self selection.
	priorSelection := paragraph text copyFrom: prior first to: prior last.
	delta := before ifTrue: [0] ifFalse: [priorSelection size - selection size].
	
	"Create first undo command."
	self replaceSelectionWith: priorSelection.
	self history previous isCompositeRedo: true.
	
	self selectInvisiblyFrom: prior first + delta to: prior last + delta.
	delta := before ifTrue: [stop - prior last] ifFalse: [start - prior first].

	"Create second undo command."
	self replaceSelectionWith: selection.
	self history previous isCompositeUndo: true.

	altInterval := prior first + delta to: prior last + delta.
				
	"If one was a caret, make it otherInterval & leave the caret after the other"
	prior first > prior last ifTrue: [self selectAt: prior last + 1].
	otherInterval := start > stop
		ifTrue: [self selectAt: altInterval last + 1. prior]
		ifFalse: [altInterval]