parts bin
initializeToStandAlone
	super initializeToStandAlone.
	self initializeWith: (ScriptingSystem formAtKey: 'Painting') deepCopy