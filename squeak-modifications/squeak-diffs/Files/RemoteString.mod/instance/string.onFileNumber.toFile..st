private
string: aStringOrText onFileNumber: fileNumber toFile: aFileStream 
	"Store this as the receiver's text if source files exist. If aStringOrText is a Text, store a marker with the string part, and then store the runs of TextAttributes in the next chunk."

	| position |
	position := aFileStream position.
	self fileNumber: fileNumber position: position.
	aFileStream nextChunkPutWithStyle: aStringOrText
	"^ self		(important)"