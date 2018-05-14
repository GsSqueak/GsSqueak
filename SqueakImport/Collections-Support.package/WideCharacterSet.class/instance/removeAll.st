removing
removeAll

	map isEmpty ifTrue: [ ^self ].
	map removeAll.
	byteArrayMap atAllPut: 0