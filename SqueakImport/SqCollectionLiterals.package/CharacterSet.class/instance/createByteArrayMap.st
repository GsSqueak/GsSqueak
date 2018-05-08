private
createByteArrayMap
	^ (0 to: 255) asByteArray collect:
		[:i | (self includes: (Character value: i)) ifTrue: [1] ifFalse: [0]]
