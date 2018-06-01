accessing
nextPut: value 
	"Send value through the receiver. If a Process has been suspended 
	waiting to receive a value through the receiver, allow it to proceed."

	accessProtect
		critical: [writePosition > contentsArray size
						ifTrue: [self makeRoomAtEnd].
				 contentsArray at: writePosition put: value.
				 writePosition := writePosition + 1].
	readSynch signal.
	^value