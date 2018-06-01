building
addParentMessages: methodReferences autoSelectString: aString 
	| currentIndentionLevel addables selectables |
	addables := methodReferences reject: [ : each | messageList includes: each ].
	selectables := addables copy
		addAll: (methodReferences select: [ : each | messageList includes: each ]) ;
		yourself.
	currentIndentionLevel := self currentIndentionLevel.
	(currentIndentionLevel = 0 and: [ addables notEmpty ]) ifTrue: 
		[ self indentEverything.
		currentIndentionLevel := 1 ].
	addables do: 
		[ : each | 
		each stringVersion: (self indentionPrefixOfSize: currentIndentionLevel - 1) , each asStringOrText.
		messageList 
			add: each
			afterIndex: self messageListIndex - 1.
		autoSelectStrings 
			add: aString
			afterIndex: self messageListIndex - 1.
		messageSelections 
			add: false
			afterIndex: self messageListIndex - 1 ].
	self deselectAll.
	selectables do:
		[ : each | | messageIndex |
		messageIndex := messageList indexOf: each.
		self
			messageAt: messageIndex 
			beSelected: true.
		autoSelectStrings
			at: messageIndex
			put: aString ].
	self changed: #messageList.
	selectables size > 0 ifTrue:
		[ self messageListIndex: (messageList indexOf: selectables first) ]