*SqClasses-fileIn/Out
fileOut
	"Create a file whose name is the name of the receiver with '.st' as the 
	extension, and file a description of the receiver onto it."
	^ self fileOutAsHtml: false
