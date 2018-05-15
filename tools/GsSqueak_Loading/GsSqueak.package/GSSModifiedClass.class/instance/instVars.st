accessing
instVars

	^ instVars ifNil: [self realClass instVarNames]