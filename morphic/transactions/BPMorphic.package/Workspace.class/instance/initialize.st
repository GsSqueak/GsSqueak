initialize-release
initialize
	super initialize.
	self initializeBindings.
	acceptDroppedMorphs := false.
	mustDeclareVariables := false