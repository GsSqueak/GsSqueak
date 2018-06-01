initialization
provideDefaultFlapIDBasedOn: aStem 
	"Provide the receiver with a default flap id"
	| _gsSqueakTemp_aNumber _gsSqueakTemp_usedIDs _gsSqueakTemp_anID |
	_gsSqueakTemp_aNumber := 0.
	_gsSqueakTemp_usedIDs := FlapTab allSubInstances
				select: [:f | f ~~ self]
				thenCollect: [:f | f flapIDOrNil].
	_gsSqueakTemp_anID := aStem.
	[_gsSqueakTemp_usedIDs includes: _gsSqueakTemp_anID]
		whileTrue: [_gsSqueakTemp_aNumber := _gsSqueakTemp_aNumber + 1.
			_gsSqueakTemp_anID := aStem , _gsSqueakTemp_aNumber asString].
	self flapID: _gsSqueakTemp_anID.
	^ _gsSqueakTemp_anID