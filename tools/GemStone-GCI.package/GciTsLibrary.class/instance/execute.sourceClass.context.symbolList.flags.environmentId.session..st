wrapper
execute: sourceString sourceClass: sourceOop context: contextObject symbolList: symbolList flags: flags environmentId: envId session: gciSession

	| result |
	self errorType newDuring: [:error |
		result := self GciTsExecute: gciSession sessionHandle
					a: sourceString
					a: sourceOop
					a: contextObject
					a: symbolList
					a: flags
					a: envId
					err: error.
		result = self oopIllegal ifTrue: [self error: 'Gci Error Execute']].
	^ result