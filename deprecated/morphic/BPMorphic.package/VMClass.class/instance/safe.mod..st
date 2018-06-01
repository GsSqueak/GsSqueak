arithmetic
safe: signedInteger mod: positiveModulus 
	| _gsSqueakTemp_remainder |
	^ (_gsSqueakTemp_remainder := signedInteger \\ positiveModulus) < 0
		ifTrue: [_gsSqueakTemp_remainder + positiveModulus]
		ifFalse: [_gsSqueakTemp_remainder]