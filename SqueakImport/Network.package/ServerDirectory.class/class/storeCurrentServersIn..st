server prefs
storeCurrentServersIn: aDirectory

	self servers do: [:each |
		| file |
		file := aDirectory fileNamed: (ServerDirectory nameForServer: each).
		each storeServerEntryOn: file.
		file close].
	self localProjectDirectories do: [:each |
		| file |
		file := aDirectory fileNamed: each localName.
		each storeServerEntryOn: file.
		file close].
