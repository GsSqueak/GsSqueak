browsing
browseMessageSet: messageList name: title autoSelect: autoSelectString
	"Open a message set or message-trace browser, depending on the #traceMessages setting."
	^ Preferences traceMessages
		ifTrue:
			[ MessageTrace
				openMessageList: messageList 
				name: title 
				autoSelect: autoSelectString ]
		ifFalse:
			[ MessageSet
				openMessageList: messageList 
				name: title 
				autoSelect: autoSelectString ]