accessing
classInstVars

	^ classInstVars ifNil: [self realClass theMetaClass instVarNames]