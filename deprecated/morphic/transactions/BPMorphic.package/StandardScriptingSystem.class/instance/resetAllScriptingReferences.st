-Etoys-utilities
resetAllScriptingReferences
	"Clear out all the elements in the References directory"
	Smalltalk at: #References put: IdentityDictionary new
	"ScriptingSystem resetAllScriptingReferences"