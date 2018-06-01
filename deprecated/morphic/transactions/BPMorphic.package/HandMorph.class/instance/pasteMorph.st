paste buffer
pasteMorph
	| _gsSqueakTemp_aPastee |
	PasteBuffer
		ifNil: [^ self inform: 'Nothing to paste.' translated].
	self attachMorph: (_gsSqueakTemp_aPastee := self objectToPaste).
	_gsSqueakTemp_aPastee align: _gsSqueakTemp_aPastee center with: self position.
	_gsSqueakTemp_aPastee player
		ifNotNil: [_gsSqueakTemp_aPastee player startRunning]