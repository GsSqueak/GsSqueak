miscellaneous
keyLike: aString satisfying: aBlock 
	"Return a key like aString that satisfies aBlock. The block should
	provide a test for acceptability -- typically the test is about whether
	the key is already in use. aBlock should return a boolean. 8/11/96 sw"
	| _gsSqueakTemp_stemAndSuffix _gsSqueakTemp_suffix _gsSqueakTemp_stem _gsSqueakTemp_newKey |
	(aBlock value: aString)
		ifTrue: [^ aString].
	_gsSqueakTemp_stemAndSuffix := aString stemAndNumericSuffix.
	_gsSqueakTemp_suffix := _gsSqueakTemp_stemAndSuffix last + 1.
	_gsSqueakTemp_stem := _gsSqueakTemp_stemAndSuffix first.
	[aBlock value: (_gsSqueakTemp_newKey := _gsSqueakTemp_stem , _gsSqueakTemp_suffix printString)]
		whileFalse: [_gsSqueakTemp_suffix := _gsSqueakTemp_suffix + 1].
	^ _gsSqueakTemp_newKey