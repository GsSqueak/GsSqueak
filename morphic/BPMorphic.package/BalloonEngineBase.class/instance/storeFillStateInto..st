storing state
storeFillStateInto: fillOop 
	| _gsSqueakTemp_fillIndex _gsSqueakTemp_leftX _gsSqueakTemp_rightX |
	_gsSqueakTemp_fillIndex := self lastExportedFillGet.
	_gsSqueakTemp_leftX := self lastExportedLeftXGet.
	_gsSqueakTemp_rightX := self lastExportedRightXGet.
	(interpreterProxy slotSizeOf: fillOop)
			< FTBalloonFillDataSize
		ifTrue: [^ interpreterProxy primitiveFail].
	interpreterProxy
		storeInteger: FTIndexIndex
		ofObject: fillOop
		withValue: (self objectIndexOf: _gsSqueakTemp_fillIndex).
	interpreterProxy
		storeInteger: FTMinXIndex
		ofObject: fillOop
		withValue: _gsSqueakTemp_leftX.
	interpreterProxy
		storeInteger: FTMaxXIndex
		ofObject: fillOop
		withValue: _gsSqueakTemp_rightX.
	interpreterProxy
		storeInteger: FTYValueIndex
		ofObject: fillOop
		withValue: self currentYGet