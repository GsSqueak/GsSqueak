accessing
ensureClosureCreationNode
	closureCreationNode
		ifNil: [closureCreationNode := SqLeafNode new key: #closureCreationNode code: nil].
	^ closureCreationNode