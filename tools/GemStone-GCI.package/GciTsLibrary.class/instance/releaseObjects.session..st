wrapper
releaseObjects: arrayOfOops session: gciSession

	| arrayPointer success |
	arrayOfOops ifEmpty: [^ true].
	arrayPointer := ExternalAddress allocate: arrayOfOops size * self wordSize.
	arrayOfOops withIndexDo: [:oop :index |
		arrayPointer
			integerAt: ((index - 1) * self wordSize) + 1
			put: oop
			size: self wordSize
			signed: false].
	self errorType newDuring: [:error |
		success := self GciTsReleaseObjs: gciSession sessionHandle
			a: arrayPointer
			a: arrayOfOops size
			err: error.
		success ifFalse: [self error: 'Gci Error ReleaseObjs']].
	arrayPointer free