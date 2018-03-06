constructor
codeCascade: receiver messages: messages 
	^ (SqBraceNode new matchBraceStreamReceiver: receiver messages: messages)
		ifNil: [SqCascadeNode new receiver: receiver messages: messages]