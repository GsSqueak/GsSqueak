scripts-kernel
okayToDestroyScriptNamed: scriptName 
	self costume world presenter allExtantPlayers
		do: [:aPlayer | (aPlayer hasScriptInvoking: scriptName ofPlayer: self)
				ifTrue: [^ false]].
	^ true