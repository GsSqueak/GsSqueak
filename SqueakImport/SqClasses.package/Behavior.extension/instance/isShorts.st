*SqClasses-testing
isShorts
	(self _env0 typeOfClass == #'bytes') ifFalse: [^ false].
    ^ (self _env0 _optionsArray) contains: [:each | each = #'2byteWords']
