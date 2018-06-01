private
makeRoomAtEnd

	| contentsSize newContentsArray |
	contentsSize := writePosition - readPosition.
	newContentsArray := contentsSize * 2 > contentsArray size
		ifTrue: [ contentsArray class new: contentsArray size * 2 ]
		ifFalse: [
			(contentsArray size > 10 and: [ contentsSize * 4 <= contentsArray size ])
				ifTrue: [ contentsArray class new: (contentsSize * 2 max: 10) ]
				ifFalse: [ contentsArray ] ].
	newContentsArray
		replaceFrom: 1
		to: contentsSize
		with: contentsArray
		startingAt: readPosition.
	contentsArray == newContentsArray 
		ifFalse: [ contentsArray := newContentsArray ]
		ifTrue: [ contentsArray from: contentsSize + 1 to: contentsArray size put: nil ].
	readPosition := 1.
	writePosition := contentsSize + 1