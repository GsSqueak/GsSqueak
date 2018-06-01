as yet unclassified
msgAccept: newText from: editor
	| category |
	category := msgListIndex = 0
		ifTrue: [ClassOrganizer default]
		ifFalse: [object class organization categoryOfElement: (msgList at: msgListIndex)].
	^ (object class compile: newText classified: category notifying: editor) ~~ nil