initialization
initialize
  "initialize the state of the receiver"

  self halt.
  ^ self initializeWith: (ScriptingSystem formAtKey: 'Painting') deepCopy