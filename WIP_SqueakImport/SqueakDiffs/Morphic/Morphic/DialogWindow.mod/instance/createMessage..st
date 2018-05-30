initialization
createMessage: aString 
	
	messageMorph := aString asText asMorph lock.
	messageMorph name: 'Message'.
	self setMessageParameters.	
	^ messageMorph