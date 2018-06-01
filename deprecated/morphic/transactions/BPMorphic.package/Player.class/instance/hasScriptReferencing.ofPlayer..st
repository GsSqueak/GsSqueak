scripts-kernel
hasScriptReferencing: slotName ofPlayer: aPlayer 
	"Answer whether the receiver bears any script that references a slot of
	the given name for the given player"
	self allScriptEditors
		do: [:anEditor | (anEditor hasScriptReferencing: slotName ofPlayer: aPlayer)
				ifTrue: [^ true]].
	^ false