halos and balloon help
preferredDuplicationHandleSelector
	"Answer the selector, either #addMakeSiblingHandle: or
	addDupHandle:, to be offered as the default in a halo open on me"
	Preferences oliveHandleForScriptedObjects
		ifFalse: [^ #addDupHandle:].
	^ self renderedMorph
		valueOfProperty: #preferredDuplicationHandleSelector
		ifAbsent: [self player class isUniClass
				ifTrue: [#addMakeSiblingHandle:]
				ifFalse: [#addDupHandle:]]