private loading
localeDirCreate: createDir
	"Try to locate the <prefs>/locale/ folder.
	If createDir is set, try to create the path.
	If it doesn't exist, return nil"

	"If this fails, there is nothing we can do about it here"
	| prefDir  localeDir |
	(createDir not
			and: [ExternalSettings preferenceDirectory isNil])
		ifTrue: [^ nil].

	prefDir := ExternalSettings assuredPreferenceDirectory.
	prefDir exists
		ifFalse: [^nil].


	localeDir := prefDir directoryNamed: 'locale'.
	createDir
		ifTrue: [localeDir assureExistence].
	^localeDir exists
		ifTrue: [localeDir]
		ifFalse: [nil]