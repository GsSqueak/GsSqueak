as yet unclassified
makeUUID

	self primMakeUUID ifNil: [
		UUIDGenerator default generateBytes: self forVersion: 4 ]