initialization
setupFromParameters
	(self includesParameter: 'showSplash')
		ifTrue: [showSplash := (self parameterAt: 'showSplash') asUppercase = 'TRUE'].
	(self includesParameter: 'flaps')
		ifTrue: [whichFlaps := (self parameterAt: 'flaps')].
