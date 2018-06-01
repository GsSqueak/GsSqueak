selector list
selectorListIndex: anInteger 
	"Set the selectorListIndex as specified, and propagate consequences"
	| methodClass index |
	methodClass := currentCompiledMethod ifNotNil: [currentCompiledMethod methodClass].
	selectorListIndex := anInteger.
	self changed: #selectorListIndex.

	messageList := self computeMessageList.
	self changed: #messageList.
	messageList size > 1 ifTrue:
		[methodClass ifNotNil: [index := messageList findFirst: [:methodRef| methodRef actualClass = methodClass]]].

	"If a method of the same class exists, select that, otherwise select the first message if any."
	self messageListIndex: (index ifNil: [1 min: messageList size])