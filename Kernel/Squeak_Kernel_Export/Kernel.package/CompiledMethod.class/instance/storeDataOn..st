file in/out
storeDataOn: aDataStream
	"Store myself on a DataStream.  I am a mixture of objects and raw data bytes.  Only use this for blocks.  Normal methodDictionaries should not be put out using ReferenceStreams.  Their fileOut should be attached to the beginning of the file."

	| byteLength lits |
	"No inst vars of the normal type"
	byteLength := self basicSize.
	aDataStream
		beginInstance: self class
		size: byteLength.
	lits := self numLiterals + 1.	"counting header"
	1 to: lits do:
		[:ii | aDataStream nextPut: (self objectAt: ii)].
	lits*4+1 to: byteLength do:
		[:ii | aDataStream byteStream nextPut: (self basicAt: ii)].
			"write bytes straight through to the file"