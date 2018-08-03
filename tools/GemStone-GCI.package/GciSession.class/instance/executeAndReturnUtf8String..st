wrapper
executeAndReturnUtf8String: sourceString

	| resultOop |
	resultOop := self gciLibrary executeUtf8String: sourceString session: self.
	^ (self gciLibrary fetchUtf8: resultOop session: self) asString