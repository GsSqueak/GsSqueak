custom commands
setAuthorInitials: aString

	self setEnv: 0.
	^ self run: 'GsPackagePolicy authorInitials: ' , aString