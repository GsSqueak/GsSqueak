customevents-scripts-kernel
existingScriptInstantiationForSelector: scriptName 
	"Answer the existing script instantiation for the given selector, or nil if
	none "
	scriptName
		ifNil: [^ nil].
	Symbol
		hasInterned: scriptName
		ifTrue: [:sym | self costume actorStateOrNil
				ifNotNil: [:actorState | ^ actorState instantiatedUserScriptsDictionary
						at: sym
						ifAbsent: []]].
	^ nil