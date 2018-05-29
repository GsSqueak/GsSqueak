as yet unclassified
makeSuccessorMorph

	| newMorph |
	self fixAllLeftOffsets.
	newMorph := self copy predecessor: self successor: successor.
	newMorph extent: self width @ 100.
	successor ifNotNil: [successor setPredecessor: newMorph].
	self setSuccessor: newMorph.
	successor recomposeChain.
	^newMorph