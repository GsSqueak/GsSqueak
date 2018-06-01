collection ops
remove: aCharacter ifAbsent: aBlock 
	| _gsSqueakTemp_index |
	(_gsSqueakTemp_index := aCharacter asciiValue + 1) <= 256
		ifFalse: [^ aBlock value].
	(map at: _gsSqueakTemp_index)
			= 0
		ifTrue: [^ aBlock value].
	map at: _gsSqueakTemp_index put: 0.
	tally := tally - 1.
	^ aCharacter