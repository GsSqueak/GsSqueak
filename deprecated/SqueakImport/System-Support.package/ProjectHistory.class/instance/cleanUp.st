project lifetime
cleanUp
	mostRecent := mostRecent reject: [ :each |
		| proj |
		proj := each fourth first.
		proj isNil or: [proj world isNil]
	].
	self changed.
