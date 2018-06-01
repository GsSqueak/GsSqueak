other
abandonOldReferenceScheme
	"Abandon the old reference scheme"
	"((Smalltalk at: #'ActiveWorld') presenter allExtantPlayers collect:
	[:aPlayer | aPlayer class]) asSet do:
	[:aPlayerClass | aPlayerClass abandonOldReferenceScheme]"
	self isUniClass
		ifTrue: [self
				userScriptsDo: [:aScript | aScript recompileScriptFromTilesUnlessTextuallyCoded].
			self class selectors
				do: [:sel | self class removeSelector: sel].
			self class instVarNames
				do: [:aName | self class removeInstVarName: aName].
			self organization removeEmptyCategories.
			self class organization removeEmptyCategories]