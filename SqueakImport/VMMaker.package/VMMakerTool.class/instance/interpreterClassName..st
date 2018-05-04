path access
interpreterClassName: aText
	"set the interpreter class name"

	[vmMaker interpreterClassName: aText asString.
	self changed: #interpreterClassName] 
		on: VMMakerException 
		do: [:ex| self inform:ex messageText. 
			^false].
	^true