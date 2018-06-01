change set utilities
newChanges: aChangeSet
	"Change the current change set, in a way that should work in 3.5 as well"
	"SARInstaller newChanges: SARInstaller currentChangeSet"

	^[ ChangeSet newChanges: aChangeSet ]
		on: MessageNotUnderstood
		do: [ :ex | ex return: (Smalltalk newChanges: aChangeSet) ]