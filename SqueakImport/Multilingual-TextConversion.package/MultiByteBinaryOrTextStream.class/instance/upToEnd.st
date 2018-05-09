public
upToEnd

	| newStream element newCollection |
	newCollection := self isBinary
				ifTrue: [ByteArray new: 100]
				ifFalse: [String new: 100].
	newStream := WriteStream on: newCollection.
	[(element := self next) notNil]
		whileTrue: [newStream nextPut: element].
	^ newStream contents
