-Etoys-utilities
cleanupsForRelease
	"Miscellaneous space cleanups to do before a release."
	"EToySystem cleanupsForRelease"
	Socket deadServer: ''.
	"Don't reveal any specific server name"
	HandMorph initialize.
	"free cached ColorChart"
	PaintBoxMorph initialize.
	"forces Prototype to let go of extra things it might hold"
	Smalltalk globals
		removeKey: #AA
		ifAbsent: [].
	Smalltalk globals
		removeKey: #BB
		ifAbsent: [].
	Smalltalk globals
		removeKey: #CC
		ifAbsent: [].
	Smalltalk globals
		removeKey: #DD
		ifAbsent: [].
	Smalltalk globals
		removeKey: #Temp
		ifAbsent: [].
	ScriptingSystem reclaimSpace.
	Smalltalk cleanOutUndeclared.
	Smalltalk reclaimDependents.
	Smalltalk removeEmptyMessageCategories.
	Symbol rehash