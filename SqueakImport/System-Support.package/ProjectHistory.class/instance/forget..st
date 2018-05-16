project lifetime
forget: aProject

	| newTuple |
	newTuple := {
		aProject name.
		aProject thumbnail.
		aProject url.
		WeakArray with: aProject.
	}.
	mostRecent := mostRecent reject: [ :each |
		each fourth first == aProject or: [
			each fourth first isNil & (each first = newTuple first)
		].
	].
	self changed.
	^newTuple