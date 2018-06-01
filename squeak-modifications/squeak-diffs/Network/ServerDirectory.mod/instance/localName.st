file directory
localName

	^ServerDirectory servers keyAtIdentityValue: self ifAbsent:[
		directory isEmpty ifTrue: [self error: 'no directory'].
		self localNameFor: directory]