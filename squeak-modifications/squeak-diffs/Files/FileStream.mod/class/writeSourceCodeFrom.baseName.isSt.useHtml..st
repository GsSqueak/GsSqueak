file reader services
writeSourceCodeFrom: aStream baseName: baseName isSt: stOrCsFlag useHtml: useHtml
	"Write the source code from aStream into a file. 
	Uses ChangeSet defaultChangeSetDirectory for consistency."

	^(ChangeSet defaultChangeSetDirectory)
		writeSourceCodeFrom: aStream 
		baseName: baseName 
		isSt: stOrCsFlag 
		useHtml: useHtml