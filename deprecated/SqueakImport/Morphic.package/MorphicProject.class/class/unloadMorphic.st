shrinking
unloadMorphic
	"MorphicProject unloadMorphic"

	Project current isMorphic ifTrue: [
		^ Error signal: 'You can only unload Morphic from within another kind of project.'].

	MorphicProject removeProjectsFromSystem.
	
	#(ActiveHand ActiveWorld ActiveEvent World) do: [:ea |
		Smalltalk globals removeKey: ea].

	{ 'ToolBuilder-Morphic' . 'MorphicTests' . 'MorphicExtras' . 'Morphic' }
		do: [ :package | (MCPackage named: package) unload ].

