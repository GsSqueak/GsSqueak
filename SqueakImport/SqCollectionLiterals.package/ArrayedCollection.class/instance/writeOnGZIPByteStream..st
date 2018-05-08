objects from disk
writeOnGZIPByteStream: aStream 
	"We only intend this for non-pointer arrays.  Do nothing if I contain pointers."

	(self class isPointers or: [ self class isWords not ]) ifTrue: [ ^self ].
	aStream nextPutAllWordArray: self
