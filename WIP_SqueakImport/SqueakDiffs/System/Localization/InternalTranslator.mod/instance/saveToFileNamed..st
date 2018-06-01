private store-retrieve
saveToFileNamed: fileNameString 
	"save the receiver's translations to a file named fileNameString"
	| stream |
	"Set true if you need to save as binary"
	false
		ifTrue: [stream := ReferenceStream fileNamed: fileNameString.
			stream nextPut: {self translations. self untranslated}.
			stream close.
			^ self].
	stream := FileStream fileNamed: fileNameString.
	[self fileOutOn: stream]
		ensure: [stream close]