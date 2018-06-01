namespace
makeReferenceFor: anObject 
	| _gsSqueakTemp_stem _gsSqueakTemp_otherNames _gsSqueakTemp_i _gsSqueakTemp_partName |
	_gsSqueakTemp_stem := anObject class name.
	(_gsSqueakTemp_stem size > 5
			and: [_gsSqueakTemp_stem endsWith: 'Morph'])
		ifTrue: [_gsSqueakTemp_stem := _gsSqueakTemp_stem copyFrom: 1 to: _gsSqueakTemp_stem size - 5].
	_gsSqueakTemp_stem := _gsSqueakTemp_stem first asLowercase asString , _gsSqueakTemp_stem allButFirst.
	_gsSqueakTemp_otherNames := self class allInstVarNames.
	_gsSqueakTemp_i := 1.
	[_gsSqueakTemp_otherNames includes: (_gsSqueakTemp_partName := _gsSqueakTemp_stem , _gsSqueakTemp_i printString)]
		whileTrue: [_gsSqueakTemp_i := _gsSqueakTemp_i + 1].
	self class addInstVarName: _gsSqueakTemp_partName.
	self instVarAt: self class instSize put: anObject.
	"assumes added as last field"
	self compileReferenceAccessorFor: _gsSqueakTemp_partName.
	^ self referenceAccessorSelectorFor: _gsSqueakTemp_partName