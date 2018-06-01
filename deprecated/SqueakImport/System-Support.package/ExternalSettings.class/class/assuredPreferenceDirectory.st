accessing
assuredPreferenceDirectory
	"Answer the preference directory, creating it if necessary"

	|  prefDir topDir |
	prefDir := self preferenceDirectory.
	prefDir
		ifNil:
			[topDir := Preferences startInUntrustedDirectory
				ifTrue: [FileDirectory on: SecurityManager default secureUserDirectory]
				ifFalse: [FileDirectory default].
			prefDir := topDir directoryNamed: self preferenceDirectoryName.
			prefDir assureExistence].
	^ prefDir