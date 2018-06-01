instance creation
request: queryString initialAnswer: defaultAnswer centerAt: aPoint inWorld: aWorld onCancelReturn: returnOnCancel acceptOnCR: acceptBoolean answerExtent: answerExtent
	"Create an instance of me whose question is queryString with the given initial answer. Invoke it centered at the given point, and answer the string the user accepts.   If the user cancels, answer returnOnCancel."
	"FillInTheBlankMorph
		request: 'Type something, then type CR.'
		initialAnswer: 'yo ho ho!'
		centerAt: Display center"

	| aFillInTheBlankMorph |
	aFillInTheBlankMorph := self new
		setQuery: queryString
		initialAnswer: defaultAnswer
		answerExtent: answerExtent
		acceptOnCR: acceptBoolean.

	aFillInTheBlankMorph createAcceptButton
		action: [aFillInTheBlankMorph textPane accept].
	aFillInTheBlankMorph createCancelButton
		action: [aFillInTheBlankMorph closeDialog: returnOnCancel].
		
	aFillInTheBlankMorph moveTo: aPoint.
	^ aFillInTheBlankMorph getUserResponse
