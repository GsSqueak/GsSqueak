accessing
fitContents
	| _gsSqueakTemp_aMorph _gsSqueakTemp_aCenter |
	_gsSqueakTemp_aCenter := self center.
	submorphs isEmpty
		ifTrue: [^ self].
	_gsSqueakTemp_aMorph := submorphs first.
	self extent: _gsSqueakTemp_aMorph extent + (borderWidth + 6).
	self center: _gsSqueakTemp_aCenter.
	_gsSqueakTemp_aMorph position: _gsSqueakTemp_aCenter - (_gsSqueakTemp_aMorph extent // 2)