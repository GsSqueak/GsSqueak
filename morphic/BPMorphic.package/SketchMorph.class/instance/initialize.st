initialization
initialize
	"initialize the state of the receiver"
	^ self initializeWith: (ScriptingSystem formAtKey: 'Painting') deepCopy