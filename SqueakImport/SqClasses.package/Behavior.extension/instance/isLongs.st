*SqClasses-testing
isLongs
	(self _env0 typeOfClass == #'bytes') ifFalse: [^ false].
    ^ (self _env0 _optionsArray) contains: [:each | each = #'8byteWords']
