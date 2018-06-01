linked frames
addSuccessor: evt 
	| _gsSqueakTemp_newMorph |
	_gsSqueakTemp_newMorph := self copy predecessor: self successor: successor.
	_gsSqueakTemp_newMorph extent: self width @ 100.
	successor
		ifNotNil: [successor setPredecessor: _gsSqueakTemp_newMorph].
	self setSuccessor: _gsSqueakTemp_newMorph.
	successor recomposeChain.
	evt hand attachMorph: _gsSqueakTemp_newMorph