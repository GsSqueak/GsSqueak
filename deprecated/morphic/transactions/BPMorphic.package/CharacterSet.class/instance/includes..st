collection ops
includes: anObject 
	| _gsSqueakTemp_index |
	anObject isCharacter
		ifFalse: [^ false].
	(_gsSqueakTemp_index := anObject asInteger + 1) > 256
		ifTrue: [^ false].
	^ (map at: _gsSqueakTemp_index)
		> 0