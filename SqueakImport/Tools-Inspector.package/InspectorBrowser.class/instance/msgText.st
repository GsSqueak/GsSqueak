as yet unclassified
msgText
	msgListIndex = 0 ifTrue: [^ nil].
	^ object class sourceCodeAt: (msgList at: msgListIndex)