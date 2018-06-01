instance creation
requestPassword: queryString initialAnswer: defaultAnswer centerAt: aPoint inWorld: aWorld onCancelReturn: returnOnCancel acceptOnCR: acceptBoolean
	"Create an instance of me whose question is queryString with the given initial answer. Invoke it centered at the given point, and answer the string the user accepts.   If the user cancels, answer returnOnCancel."
	"FillInTheBlankMorph
		request: 'Type something, then type CR.'
		initialAnswer: 'yo ho ho!'
		centerAt: Display center"

	| aFillInTheBlankMorph |
	aFillInTheBlankMorph := self new
		setPasswordQuery: queryString
		initialAnswer: defaultAnswer
		answerHeight: 50
		acceptOnCR: acceptBoolean.

	aFillInTheBlankMorph createAcceptButton
		action: [aFillInTheBlankMorph textPane accept].
	aFillInTheBlankMorph createCancelButton
		action: [aFillInTheBlankMorph closeDialog: returnOnCancel].
		
	aFillInTheBlankMorph moveTo: aPoint.
	^ aFillInTheBlankMorph getUserResponse