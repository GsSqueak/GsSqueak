release
release

	self delete.

	world == nil ifFalse: [
		world release.
		world := nil].

	^ super release