current changeset
current
	"return the current changeset
	assure first that we have a named changeset. To cure mantis #4535. "
	current isMoribund
		ifTrue: [(ChangeSet newChanges: (ChangeSet assuredChangeSetNamed: 'Unnamed'))] .

	^ current