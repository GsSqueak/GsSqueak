file status
entryAt: fileName ifAbsent: aBlock
	"Find the entry with local name fileName and answer it.
	 If not found, answer the result of evaluating aBlock."

	self exists ifFalse: [^aBlock value].

	^(self directoryEntryForName: fileName) ifNil: [ aBlock value ]
