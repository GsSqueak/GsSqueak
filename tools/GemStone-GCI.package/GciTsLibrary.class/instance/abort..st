wrapper
abort: gciSession

	| success |
	self errorType newDuring: [:error |
		success := self
			GciTsAbort: gciSession sessionHandle
			err: error.
		success ifFalse: [self error: 'Gci Abort Error']]