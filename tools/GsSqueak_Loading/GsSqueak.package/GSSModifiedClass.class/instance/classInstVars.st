accessing
classInstVars

	^ classInstVars ifNil: [self realClass classInstVarNames]