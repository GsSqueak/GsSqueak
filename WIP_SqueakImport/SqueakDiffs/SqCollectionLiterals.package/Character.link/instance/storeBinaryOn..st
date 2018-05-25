printing
storeBinaryOn: aStream
	"Store the receiver on a binary (file) stream"
	
	| integerValue |
	(integerValue := self asInteger) < 256 
		ifTrue: [ aStream basicNextPut: self ]
		ifFalse: [ aStream nextInt32Put: integerValue ]
