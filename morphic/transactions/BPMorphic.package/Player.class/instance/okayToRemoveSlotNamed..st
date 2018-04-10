scripts-kernel
okayToRemoveSlotNamed: aSlotName 
	self costume world presenter allExtantPlayers
		do: [:aPlayer | (aPlayer hasScriptReferencing: aSlotName ofPlayer: self)
				ifTrue: [^ false]].
	^ true