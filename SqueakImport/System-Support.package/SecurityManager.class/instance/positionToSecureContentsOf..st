security operations
positionToSecureContentsOf: aStream
	| bytes trusted part1 part2 sig hash dsa okay pos |
	aStream binary.
	pos := aStream position.
	bytes := aStream next: 4.
	bytes = 'SPRJ' asByteArray ifFalse:[
		"was not signed"
		aStream position: pos.
		^false].
	part1 := (aStream nextInto: (LargePositiveInteger basicNew: 20)) normalize.
	part2 := (aStream nextInto: (LargePositiveInteger basicNew: 20)) normalize.
	sig := Array with: part1 with: part2.
	hash := SecureHashAlgorithm new hashStream: aStream.
	dsa := DigitalSignatureAlgorithm new.
	trusted := self trustedKeys.
	okay := trusted anySatisfy: [:key| dsa verifySignature: sig ofMessageHash: hash publicKey: key].
	aStream position: pos+44.
	^okay