accessing
startRetrieval
	| fileStream |
	cachedName == nil ifTrue:[^super startRetrieval].
	(FileDirectory default fileExists: cachedName) ifTrue:[
		fileStream := FileStream concreteStream new open: cachedName forWrite: false.
		fileStream == nil ifFalse:[^self content: 
			(MIMEDocument 
				contentType: 'text/plain' 
				content: fileStream contentsOfEntireFile)].
		FileDirectory default deleteFileNamed: cachedName ifAbsent:[]].
	super startRetrieval. "fetch from URL"
	"and cache in file dir"
	fileStream := FileStream concreteStream new open: cachedName forWrite: true.
	fileStream == nil ifFalse:[
		fileStream nextPutAll: (content content).
		fileStream close].