code execution
executeString: sourceString

	| result |
	result := self gciSession executeAndReturnUtf8String: sourceString squeakToUtf8.
	^ result utf8ToSqueak