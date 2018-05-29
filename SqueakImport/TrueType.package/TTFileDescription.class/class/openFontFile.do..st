instance creation
openFontFile: fontFileName do: aBlock
	"Open the font with the given font file name"
	| fontFilePath file |
	fontFilePath := FontPaths at: fontFileName 
		ifAbsentPut:[self findFontFile: fontFileName].
	fontFilePath ifNil:[^nil].
	file := [FileStream readOnlyFileNamed: fontFilePath] on: Error do:[:ex|
		"We lost the font; someone might have moved it away"
		fontFilePath removeKey: fontFileName ifAbsent:[].
		^nil
	].
	^[aBlock value: file binary] ensure:[file close].