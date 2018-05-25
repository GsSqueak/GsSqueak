*SqKernel-printing
printSourceOn: aStream 
	self decompile
		ifNil: [ aStream nextPutAll: '--source missing--' ]
		ifNotNil: [ : blockNode | blockNode printOn: aStream indent: 0 ]

