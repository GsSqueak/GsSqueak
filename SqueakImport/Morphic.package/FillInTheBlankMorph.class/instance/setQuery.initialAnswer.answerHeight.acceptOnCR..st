initialization
setQuery: queryString initialAnswer: initialAnswer answerHeight: answerHeight acceptOnCR: acceptBoolean
	self setQuery: queryString initialAnswer: initialAnswer 
		answerExtent: (self class defaultAnswerExtent x @ answerHeight) 
		acceptOnCR: acceptBoolean
