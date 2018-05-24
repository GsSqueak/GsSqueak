read write
appendClassDefns
	"Make this a fileOut format file.  For each UniClass mentioned, prepend its source code to the file.  Class name conflicts during reading will be resolved then.  Assume instVarInfo: has already been done."

| asciiStream |
asciiStream := (String new: 1024) writeStream.
byteStream position = 0 ifTrue: [
	byteStream setFileTypeToObject.
		"Type and Creator not to be text, so can attach correctly to an email msg"
	asciiStream header; timeStamp].

asciiStream cr; nextPutAll: '!ObjectScanner new initialize!'; cr; cr.
self uniClasesDo: [:class | class
		class sharedPools size > 0 ifTrue:  "This never happens"
			[class shouldFileOutPools
				ifTrue: [class fileOutSharedPoolsOn: self]].
		class fileOutOn: asciiStream moveSource: false toFile: 0].	
		"UniClasses are filed out normally, no special format."

	asciiStream trailer.	"Does nothing for normal files.  
		HTML streams will have trouble with object data"

	"Append the object's raw data"
	asciiStream cr; cr; nextPutAll: '!self smartRefStream!'.
	byteStream nextPutAll: asciiStream contents asByteArray.		"get ready for objects"
