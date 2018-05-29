building
addChildMessages: methodReferences autoSelectString: aString 
	| currentIndentionLevel addables selectables selectableString newAnchor |
	selectableString := aString keywords 
		ifEmpty: [ String empty ] 
		ifNotEmptyDo: [ : keywords | keywords first ].
	[ (messageListIndex between: 1 and: autoSelectStrings size) ]
		whileFalse:
			[ autoSelectStrings add: selectableString ].
	autoSelectStrings 
		at: messageListIndex
		put: selectableString.
	currentIndentionLevel := self currentIndentionLevel.
	"Don't add mulitple copies of the same method, if a method is already in the list we will merely select it."
	addables := methodReferences reject: [ : each | messageList includes: each ].
	addables do: 
		[ : each | 
		each stringVersion: (self indentionPrefixOfSize: currentIndentionLevel + 1) , each asStringOrText.
		messageList 
			add: each
			afterIndex: self messageListIndex.
		autoSelectStrings 
			add: nil
			afterIndex: self messageListIndex.
		messageSelections 
			add: false
			afterIndex: self messageListIndex ].
	selectables := 
		addables copy
			addAll: (methodReferences select: [ : each | messageList includes: each ]) ;
			yourself.
	self deselectAll.
	anchorIndex := nil.
	selectables do:
		[ : each |
		self
			messageAt: (newAnchor := messageList indexOf: each) 
			beSelected: true.
		anchorIndex ifNil: [ anchorIndex := newAnchor ] ].
	self changed: #messageList.
	"Select the first child method."
	self messageListIndex: 
		(selectables size > 0
			ifTrue: [ messageList indexOf: selectables last ]
			ifFalse: [ messageList ifEmpty: [ 0 ] ifNotEmpty: [ 1 ] ])