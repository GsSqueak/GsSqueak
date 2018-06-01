access
pathString
	self path isEmpty ifTrue: [ ^'/' copy ].

	^String streamContents: [ :s |
		self path do: [ :p |
		 	s nextPut: $/.
			s nextPutAll: p ] ]