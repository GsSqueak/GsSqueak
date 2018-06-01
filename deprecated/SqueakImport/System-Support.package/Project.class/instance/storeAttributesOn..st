file in/out
storeAttributesOn: aStream

	| details |
	self storeAttributeKey: 'Squeak-Version' value: SystemVersion current version on: aStream.
	self storeAttributeKey: 'Squeak-LatestUpdate' value: SystemVersion current highestUpdate printString on: aStream.
	self storeAttributeKey: 'File-Name-Encoding' value: LanguageEnvironment defaultFileNameConverter class encodingNames first on: aStream.

	details := self world valueOfProperty: #ProjectDetails ifAbsent: [Dictionary new].
	details associationsDo: [:assoc |
		self storeAttributeKey: assoc key asString value: assoc value asString on: aStream.].
