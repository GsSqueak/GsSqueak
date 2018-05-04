*EnvironmentsEnv7-operations
recompileAll
	self allClassesAndTraits
		do: [:classOrTrait | classOrTrait compileAll]
		displayingProgress: [:classOrTrait | 'Recompiling ' , classOrTrait]
