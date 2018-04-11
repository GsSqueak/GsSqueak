compilation
addPartNameLike: className withValue: aMorph 
	| _gsSqueakTemp_otherNames _gsSqueakTemp_i _gsSqueakTemp_default _gsSqueakTemp_partName _gsSqueakTemp_stem |
	_gsSqueakTemp_stem := className first asLowercase asString , className allButFirst.
	_gsSqueakTemp_otherNames := self class allInstVarNames.
	_gsSqueakTemp_i := 1.
	[_gsSqueakTemp_otherNames includes: (_gsSqueakTemp_default := _gsSqueakTemp_stem , _gsSqueakTemp_i printString)]
		whileTrue: [_gsSqueakTemp_i := _gsSqueakTemp_i + 1].
	_gsSqueakTemp_partName := UIManager default request: 'Please give this part a name' initialAnswer: _gsSqueakTemp_default.
	(_gsSqueakTemp_otherNames includes: _gsSqueakTemp_partName)
		ifTrue: [self inform: 'Sorry, that name is already used'.
			^ nil].
	self class addInstVarName: _gsSqueakTemp_partName.
	self instVarAt: self class instSize put: aMorph.
	"Assumes added as last field"
	^ _gsSqueakTemp_partName