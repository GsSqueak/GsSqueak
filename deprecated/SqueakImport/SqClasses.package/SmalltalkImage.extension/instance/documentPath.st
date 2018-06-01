*SqClasses-*SqClasses-*SqClasses-command line
documentPath
	"Answer the absolute path of the document passed to the vm or nil if none."
	"Smalltalk commandLine documentPath"
	^ Preferences readDocumentAtStartup ifTrue: [ self getSystemAttribute: 2 ]
