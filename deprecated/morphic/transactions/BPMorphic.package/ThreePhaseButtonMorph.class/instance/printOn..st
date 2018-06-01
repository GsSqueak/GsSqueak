printing
printOn: aStream 
	| _gsSqueakTemp_string |
	aStream nextPutAll: '3PButton'.
	arguments notEmpty
		ifTrue: [_gsSqueakTemp_string := arguments
						at: (2 min: arguments size)].
	aStream nextPutAll: '('.
	(_gsSqueakTemp_string notNil
			and: [_gsSqueakTemp_string ~~ self])
		ifTrue: [aStream print: _gsSqueakTemp_string;
				 space]
		ifFalse: [aStream print: actionSelector;
				 space].
	aStream print: self identityHash;
		 nextPutAll: ')'