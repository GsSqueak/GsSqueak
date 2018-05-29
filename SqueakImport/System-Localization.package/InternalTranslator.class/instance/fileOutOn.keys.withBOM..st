fileIn/fileOut
fileOutOn: aStream keys: keys withBOM: bomFlag
	"self current fileOutOn: Transcript. Transcript endEntry"
	self fileOutHeaderOn: aStream withBOM: bomFlag.
	(keys
		ifNil: [generics keys sort])
		do: [:key | self
				nextChunkPut: (generics associationAt: key)
				on: aStream].
	keys
		ifNil: [self untranslated
				do: [:each | self nextChunkPut: each -> '' on: aStream]].
	aStream nextPut: $!;
		 cr