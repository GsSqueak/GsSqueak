initialization
setPasswordQuery: queryString initialAnswer: initialAnswer answerHeight: answerHeight acceptOnCR: acceptBoolean

	self setQuery: queryString 
		initialAnswer: initialAnswer 
		answerHeight: answerHeight 
		acceptOnCR: acceptBoolean.
	textPane font: (StrikeFont passwordFontSize: 12).