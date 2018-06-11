initialize-release
login

	self gciLibrary errorType newDuring: [:error |
		sessionHandle := self gciLibrary GciTsLogin: self sessionDescription stoneNRS
			a: self sessionDescription osUser
			a: self sessionDescription osPassword
			a: false
			a: self sessionDescription gemNRS
			a: self sessionDescription userID
			a: self sessionDescription password
			a: 2r1000000
			a: 0
			err: error.
		self sessionHandle isNull ifTrue: [self error: 'Gci Login Error']]