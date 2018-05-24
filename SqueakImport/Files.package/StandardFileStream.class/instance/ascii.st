properties-setting
ascii
	"Read and/or write in ASCII mode."
	buffer1
		ifNil: [ buffer1 := ByteString new: 1 ]
		ifNotNil: [ ByteString adoptInstance: buffer1 ].
	collection ifNotNil: [ ByteString adoptInstance: collection ].
	lastWritten ifNotNil:
		[ lastWritten isInteger ifTrue: [ lastWritten := lastWritten asCharacter ] ]