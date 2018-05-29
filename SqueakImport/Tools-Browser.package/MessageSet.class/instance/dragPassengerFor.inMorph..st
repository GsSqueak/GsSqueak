drag and drop
dragPassengerFor: item inMorph: dragSource 
	| transferType |
	transferType := self dragTransferTypeForMorph: dragSource.
	transferType == #messageList
		ifTrue: [^self selectedClassOrMetaClass->(item contents findTokens: ' ') second asSymbol].
	transferType == #classList
		ifTrue: [^self selectedClass].
	^nil