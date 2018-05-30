server prefs
fetchExternalSettingsIn: aDirectory
	"Scan for server configuration files"
	"ServerDirectory fetchExternalSettingsIn: (FileDirectory default directoryNamed: 'prefs')"

	| serverConfDir |
	(aDirectory directoryExists: self serverConfDirectoryName)
		ifFalse: [^self].
	self resetLocalProjectDirectories.
	serverConfDir := aDirectory directoryNamed: self serverConfDirectoryName.
	serverConfDir fileNames do: [:fileName | | stream |
		stream := serverConfDir readOnlyFileNamed: fileName.
		stream
			ifNotNil: [
				[self parseServerEntryFrom: stream] ifError: [:err :rcvr | ].
				stream close]]