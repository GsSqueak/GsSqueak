proxy settings
fetchExternalSettingsIn: aDirectory
	"Scan for server configuration files"
	"HTTPSocket fetchExternalSettingsIn: (FileDirectory default directoryNamed: 'prefs')"

	| stream entries |
	(aDirectory fileExists: self proxySettingsFileName)
		ifFalse: [^self].
	stream := aDirectory readOnlyFileNamed: self proxySettingsFileName.
	stream
		ifNotNil: [
			[entries := ExternalSettings parseServerEntryArgsFrom: stream]
				ensure: [stream close]].

	entries ifNil: [^self].

	self httpProxyServer:  (entries at: 'host' ifAbsent: [nil]).
	self httpProxyPort: ((entries at: 'port' ifAbsent: ['80']) asInteger ifNil: [self defaultPort]).
	HTTPSocket addProxyException: (entries at: 'exception' ifAbsent: [nil])