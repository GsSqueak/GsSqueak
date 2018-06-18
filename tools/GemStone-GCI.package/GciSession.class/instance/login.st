initialize-release
login

	(self sessionDescription isNil or: [self sessionDescription isInvalid])
		ifTrue: [^ self error: 'Invalid SessionDescription'].
	sessionHandle := self gciLibrary
						login: self sessionDescription stoneNRS
						gemNRS: self sessionDescription gemNRS
						gemstoneUser: self sessionDescription userID
						gemstonePassword: self sessionDescription password
						gemstonePasswordIsEncrypted: false