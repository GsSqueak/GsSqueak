change set utilities
currentChangeSet
	"Answer the current change set, in a way that should work in 3.5 as well"

	"SARInstaller currentChangeSet"

	^[ ChangeSet current ]
		on: MessageNotUnderstood
		do: [ :ex | ex return: Smalltalk changes ]