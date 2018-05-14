squeak protocol
fromString: aString


	^ self readFrom: (ReadStream on: aString)