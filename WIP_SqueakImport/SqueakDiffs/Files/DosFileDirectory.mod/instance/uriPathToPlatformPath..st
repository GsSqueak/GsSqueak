*network-uri
uriPathToPlatformPath: aString
	"Convert a URI path (w/ forward slashes) into a platform path if necessary.
	Also make sure we deal properly with shares vs. drives"
	| parts path |
	path := aString unescapePercents.
	parts := path findTokens: '/'.
	(parts first endsWith: ':') ifTrue:[
		"it's a drive - compose c:\foo\bar"
		^path allButFirst copyReplaceAll: '/' with: '\'
	] ifFalse:[
		"it's a share - compose \\share\foo\bar"
		^'\', (path copyReplaceAll: '/' with: '\')
	].