enumerating
select: aBlock
	^LazyCharacterSet including: [:c | (absent includes: c) not and: [aBlock value: c]]