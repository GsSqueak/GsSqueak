instance creation
request: queryString initialAnswer: defaultAnswer centerAt: aPoint inWorld: aWorld onCancelReturn: returnOnCancel acceptOnCR: acceptBoolean
	"Create an instance of me whose question is queryString with the given initial answer. Invoke it centered at the given point, and answer the string the user accepts.   If the user cancels, answer returnOnCancel."

	^ self request: queryString initialAnswer: defaultAnswer centerAt: aPoint 
		inWorld: aWorld onCancelReturn: returnOnCancel 
		acceptOnCR: acceptBoolean answerExtent: self defaultAnswerExtent