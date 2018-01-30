linked frames
addPredecessor: evt 
	| _gsSqueakTemp_newMorph |
	_gsSqueakTemp_newMorph := self copy predecessor: predecessor successor: self.
	_gsSqueakTemp_newMorph extent: self width @ 100.
	predecessor
		ifNotNil: [predecessor setSuccessor: _gsSqueakTemp_newMorph].
	self setPredecessor: _gsSqueakTemp_newMorph.
	predecessor recomposeChain.
	evt hand attachMorph: _gsSqueakTemp_newMorph