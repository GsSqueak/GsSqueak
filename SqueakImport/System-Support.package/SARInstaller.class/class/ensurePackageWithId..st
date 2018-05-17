package format support
ensurePackageWithId: anIdString

	self squeakMapDo: [ :sm | | newCS |
		self withCurrentChangeSetNamed: 'updates' do: [ :cs |
			| card |
			newCS := cs.
			card := sm cardWithId: anIdString.
			(card isNil or: [ card isInstalled not or: [ card isOld ]])
				ifTrue: [ sm installPackageWithId: anIdString ]
		].
		newCS isEmpty ifTrue: [ ChangeSet removeChangeSet: newCS ]
	].