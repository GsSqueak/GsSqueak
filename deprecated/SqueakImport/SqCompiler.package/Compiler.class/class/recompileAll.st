utilities
recompileAll	"Compiler recompileAll"
	"Recompile all classes and traits in the system"

	Smalltalk allClassesAndTraits 
		do: [:classOrTrait | classOrTrait compileAll] 
		displayingProgress:[:classOrTrait| 'Recompiling ', classOrTrait]


