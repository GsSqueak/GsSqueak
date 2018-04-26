*SqClasses-testing
isBytes
	(self _env0 typeOfClass == #'bytes') ifFalse: [^ false].
    ((self _env0 _optionsArray) _env0 size > 0) ifTrue: [^ false].
    ^ true
