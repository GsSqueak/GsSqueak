miscellaneous
keyLike: aString withTrailing: trailerString satisfying: aBlock 
	"Return a key like (aString, trailerString) that satisfies aBlock. The
	block should provide a test for acceptability -- typically the test is
	about whether the key is already in use. aBlock should return a
	boolean. 8/11/96 sw"
	| _gsSqueakTemp_stemAndSuffix _gsSqueakTemp_suffix _gsSqueakTemp_stem _gsSqueakTemp_composite |
	_gsSqueakTemp_composite := aString , trailerString.
	(aBlock value: _gsSqueakTemp_composite)
		ifTrue: [^ _gsSqueakTemp_composite].
	_gsSqueakTemp_stemAndSuffix := aString stemAndNumericSuffix.
	_gsSqueakTemp_suffix := _gsSqueakTemp_stemAndSuffix last + 1.
	_gsSqueakTemp_stem := _gsSqueakTemp_stemAndSuffix first.
	[aBlock value: (_gsSqueakTemp_composite := _gsSqueakTemp_stem , _gsSqueakTemp_suffix printString , trailerString)]
		whileFalse: [_gsSqueakTemp_suffix := _gsSqueakTemp_suffix + 1].
	^ _gsSqueakTemp_composite