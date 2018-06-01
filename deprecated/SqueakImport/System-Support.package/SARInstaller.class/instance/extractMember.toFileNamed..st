client services
extractMember: aMemberOrName toFileNamed: aFileName
	"Extract aMemberOrName to a specified filename"
	(self zip extractMember: aMemberOrName toFileNamed: aFileName)
		ifNil: [ self errorNoSuchMember: aMemberOrName ]
		ifNotNil: [ self installed: aMemberOrName ].