-MorphicExtras-class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | 
			cl registerQuad: #(#ScriptingSystem #prototypicalHolder 'Holder' 'A place for storing alternative pictures in an animation, etc.' ) forFlapNamed: 'PlugIn Supplies'.
			cl registerQuad: #(#ScriptingSystem #prototypicalHolder 'Holder' 'A place for storing alternative pictures in an animation, etc.' ) forFlapNamed: 'Supplies'.
			cl registerQuad: #(#ScriptingSystem #newScriptingSpace 'Scripting' 'A confined place for drawing and scripting, with its own private stop/step/go buttons.' ) forFlapNamed: 'Widgets'.
			cl registerQuad: #(#ScriptingSystem #holderWithAlphabet 'Alphabet' 'A source for single-letter objects' ) forFlapNamed: 'Widgets']