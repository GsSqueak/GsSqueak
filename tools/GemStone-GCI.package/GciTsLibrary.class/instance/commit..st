wrapper
commit: gciSession

	| success |
	self errorType newDuring: [:error |
		success := self
			GciTsCommit: gciSession sessionHandle
			err: error.
		success ifFalse: [self error: 'Gci Commit Error']]