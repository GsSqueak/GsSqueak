wrapper
logout: gciSession

	| success |
	self errorType newDuring: [:error |
		success := self
			GciTsLogout: gciSession sessionHandle
			err: error.
		success ifFalse: [self error: 'Gci Logout Error']]