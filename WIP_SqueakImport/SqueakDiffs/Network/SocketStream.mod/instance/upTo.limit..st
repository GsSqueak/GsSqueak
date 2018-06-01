stream in
upTo: aCharacterOrByte limit: nBytes
	"Return data up to, but not including given character or byte. If the character is not in the stream, or not found within nBytes answer the available contents of the stream"

	| target index result searchedSoFar |
	"Deal with ascii vs. binary"
	self isBinary 
		ifTrue:[target := aCharacterOrByte asInteger] 
		ifFalse:[target := aCharacterOrByte asCharacter].

	"Look in the current inBuffer first"
	index := inBuffer indexOf: target startingAt: lastRead + 1.

	(index > 0 and: [(index + 1) <= inNextToWrite]) ifTrue: ["found it"
		result := self nextInBuffer: index - lastRead - 1.
		self skip: 1.
		^ result
	].

	[searchedSoFar :=  self inBufferSize.
	"Receive more data"
	self receiveData.
	"We only get recentlyRead = 0 in the case of a non-signaling socket close."
	recentlyRead > 0] whileTrue:[
		"Data begins at lastRead + 1, we add searchedSoFar as offset."

		index := inBuffer indexOf: target startingAt: (lastRead + searchedSoFar + 1).
		(index > 0 and: [(index + 1) <= inNextToWrite]) ifTrue: ["found it"
			result := self nextInBuffer: index - lastRead - 1.
			self skip: 1.
			^ result
		].

		"Check if we've exceeded the max. amount"
		(nBytes notNil and:[inNextToWrite - lastRead > nBytes]) 
			ifTrue:[^self nextAllInBuffer].
	].

	"not found and (non-signaling) connection was closed"
	^self nextAllInBuffer