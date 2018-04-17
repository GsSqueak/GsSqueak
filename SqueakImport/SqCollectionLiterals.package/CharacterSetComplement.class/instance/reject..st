enumerating
reject: aBlock
	^LazyCharacterSet including: [:c | (absent includes: c) not and: [(aBlock value: c) not]]