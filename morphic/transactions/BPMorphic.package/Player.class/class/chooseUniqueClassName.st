other
chooseUniqueClassName
	| _gsSqueakTemp_ii _gsSqueakTemp_className |
	_gsSqueakTemp_ii := BiggestSubclassNumber
				ifNil: [1]
				ifNotNil: [BiggestSubclassNumber + 1].
	[_gsSqueakTemp_className := (self name , _gsSqueakTemp_ii printString) asSymbol.
	Smalltalk includesKey: _gsSqueakTemp_className]
		whileTrue: [_gsSqueakTemp_ii := _gsSqueakTemp_ii + 1].
	BiggestSubclassNumber := _gsSqueakTemp_ii.
	^ _gsSqueakTemp_className