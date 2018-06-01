messages
msgList

	^msgList ifNil: [ msgList := object class selectors sort ]