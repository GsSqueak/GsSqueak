initialize-release
logout

	| success |
	self gciLibrary errorType newDuring: [:error |
		success := self gciLibrary
			GciTsLogout: self sessionHandle
			err: error.
		success ifFalse: [self error: 'Gci Logout Error']]