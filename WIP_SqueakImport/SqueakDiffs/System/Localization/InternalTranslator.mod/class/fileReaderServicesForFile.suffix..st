file-services
fileReaderServicesForFile: fullName suffix: suffix 
	"Answer the file services associated with given file"
	^ (suffix = self translationSuffix) | (suffix = '*')
		ifTrue: [{self serviceMergeLanguageTranslations}]
		ifFalse: [#()]