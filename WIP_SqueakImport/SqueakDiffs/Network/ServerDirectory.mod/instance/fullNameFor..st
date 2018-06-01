file directory
fullNameFor: aFileName
	"Convention: 
	If it is an absolute path, directory stored with a leading slash, and url has no user@.
	If relative path, directory stored with no leading slash, and url begins user@.
	Should we include ftp:// on the front?"

	urlObject ifNotNil: [^ urlObject pathString, aFileName].
	(aFileName includes: self pathNameDelimiter)
		ifTrue: [^ aFileName].
	self isTypeHTTP ifTrue: [
		^ self downloadUrl, aFileName].
	directory isEmpty ifTrue: [^ server, 
		self pathNameDelimiter asString, aFileName].
	^ (directory first == $/ ifTrue: [''] ifFalse: [user,'@']), 
		server, self slashDirectory, 
		self pathNameDelimiter asString, aFileName