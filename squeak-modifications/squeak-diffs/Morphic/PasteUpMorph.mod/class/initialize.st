*MorphicExtras-class initialization
initialize
    "ensure correct initialize order during GsSqueak bootstrap"
    StandardScriptingSystem initialize.
    
	"Initialize the class"

	#('keyStroke') translatedNoop.

	self registerInFlapsRegistry.	
	ScriptingSystem addCustomEventFor: self named: #keyStroke help: 'when a keystroke happens and nobody heard it' translatedNoop targetMorphClass: PasteUpMorph.
