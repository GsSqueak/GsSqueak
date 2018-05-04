enumerating
nodesDo: aBlock

	statements do: [ :s | s nodesDo: aBlock ].	
	aBlock value: self.