class initialization
initialize
  "Initialize the scripting system. Sometimes this method is vacuously
	changed just to get it in a changeset so that its invocation will occur
	as part of an update"

  FormDictionary := IdentityDictionary new.
  (self environment at: #'ScriptingSystem' ifAbsent: [  ])
    ifNil: [ self environment at: #'ScriptingSystem' put: self new ].
  (Smalltalk at: #'ScriptingSystem') initializeHelpStrings.
  self registerInFlapsRegistry.
  FormDictionary := Dictionary new.
  self loadSqueakyMouse