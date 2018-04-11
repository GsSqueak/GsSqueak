scripts-kernel
hasScriptInvoking: scriptName ofPlayer: aPlayer 
	"Answer whether the receiver bears any script that invokes a script of
	the given name for the given player"
	self allScriptEditors
		do: [:anEditor | (anEditor hasScriptInvoking: scriptName ofPlayer: aPlayer)
				ifTrue: [^ true]].
	^ false