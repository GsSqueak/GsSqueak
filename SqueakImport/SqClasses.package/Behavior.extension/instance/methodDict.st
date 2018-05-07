*SqClasses-accessing
methodDict
	^ (self _env0 persistentMethodDictForEnv: 7) ifNil: [MethodDictionary new]
