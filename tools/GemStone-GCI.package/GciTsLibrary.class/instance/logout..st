wrapper
logout: sessionHandle

	| success |
	self errorType newDuring: [:error |
		success := self
			GciTsLogout: sessionHandle
			err: error.
		success ifFalse: [self error: 'Gci Logout Error']]