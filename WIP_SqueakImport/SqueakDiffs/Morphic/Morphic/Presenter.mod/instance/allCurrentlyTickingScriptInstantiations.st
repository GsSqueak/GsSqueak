stubs
allCurrentlyTickingScriptInstantiations
	"Answer a list of ScriptInstantiation objects representing all the scripts within the scope of the receiver which are currently ticking."

	^ Array streamContents:
		[:aStream | 
			self allExtantPlayers do:
				[:aPlayer | aPlayer instantiatedUserScriptsDo:
					[:aScriptInstantiation |
						aScriptInstantiation status == #ticking ifTrue:
							[aStream nextPut: aScriptInstantiation]]]]