properties-setting
binary
	"Read and/or write in binary mode."
	buffer1
		ifNil: [ buffer1 := ByteArray new: 1 ]
		ifNotNil: [ ByteArray adoptInstance: buffer1 ].
	collection ifNotNil: [ ByteArray adoptInstance: collection ].
	lastWritten ifNotNil:
		[ lastWritten isCharacter ifTrue: [ lastWritten := lastWritten asInteger ] ]