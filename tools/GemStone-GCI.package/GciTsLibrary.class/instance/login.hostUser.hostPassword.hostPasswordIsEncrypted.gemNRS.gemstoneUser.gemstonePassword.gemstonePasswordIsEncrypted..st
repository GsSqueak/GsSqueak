wrapper
login: stoneNRS hostUser: hostUser hostPassword: hostPassword hostPasswordIsEncrypted: hostPasswordIsEncrypted gemNRS: gemNRS gemstoneUser: gemstoneUsername gemstonePassword: gemstonePassword gemstonePasswordIsEncrypted: gemstonePasswordIsEncrypted

	| sessionHandle |
	self errorType newDuring: [:error |
		sessionHandle := self GciTsLogin: stoneNRS
							a: hostUser
							a: hostPassword
							a: hostPasswordIsEncrypted
							a: gemNRS
							a: gemstoneUsername
							a: gemstonePassword
							a: (2r1000000 bitOr: (gemstonePasswordIsEncrypted ifTrue: [1] ifFalse: [0]))
							a: 0
							err: error.
		sessionHandle isNull ifTrue: [self error: 'Gci Login Error']].
	^ sessionHandle