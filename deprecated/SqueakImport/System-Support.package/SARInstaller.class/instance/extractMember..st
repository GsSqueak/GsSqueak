client services
extractMember: aMemberOrName
	"Extract aMemberOrName to a file using its filename"
	(self zip extractMember: aMemberOrName)
		ifNil: [ self errorNoSuchMember: aMemberOrName ]
		ifNotNil: [ self installed: aMemberOrName ].