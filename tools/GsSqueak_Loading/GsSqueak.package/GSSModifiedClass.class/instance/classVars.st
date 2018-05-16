accessing
classVars

	^ classVars ifNil: [self realClass classVarNames]