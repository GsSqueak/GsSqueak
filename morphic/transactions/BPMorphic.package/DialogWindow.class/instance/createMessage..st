initialization
createMessage: aString 
	messageMorph := aString asText asMorph lock.
	self setMessageParameters.
	^ messageMorph