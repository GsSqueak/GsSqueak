wrapper
executeAndReturnUtf8String: sourceString

	| resultOop |
	resultOop := self gciLibrary executeUtf8String: sourceString session: self sessionHandle.
	^ self gciLibrary fetchUtf8: resultOop session: self sessionHandle