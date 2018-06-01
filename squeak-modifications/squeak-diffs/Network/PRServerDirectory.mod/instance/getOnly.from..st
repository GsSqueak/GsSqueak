file directory
getOnly: numberOfBytes from: fileNameOnServer 
	"Just capture the first numberOfBytes of the file.  
	 
	Goes faster for long files. Return the contents, not a stream."
	| fileName |
	self flag: #todo.
	"use LRUCache"
	fileName := fileNameOnServer
				allButFirst: (fileNameOnServer lastIndexOf: self pathNameDelimiter).
	""
	^ self getOnly: numberOfBytes ofProjectContents: fileName