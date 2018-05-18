world state
checkCurrentHandForObjectToPaste

	| response |
	self primaryHand pasteBuffer ifNil: [^self].
	response := UIManager default chooseFrom: #('Delete' 'Keep')
		title: 'Hand is holding a Morph in its paste buffer:\' withCRs,
			self primaryHand pasteBuffer printString.
	response = 1 ifTrue: [self primaryHand pasteBuffer: nil].
