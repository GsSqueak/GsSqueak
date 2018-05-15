private
chooseServiceFrom: aCollection
	"private - choose a service from aCollection asking the user if  needed"
	^aCollection size = 1 
		ifTrue: [aCollection anyOne]
		ifFalse:[UIManager default 
			chooseFrom: (aCollection collect:[:each| each label])
			values: aCollection
			title: 'You dropped a file. Please choose a service:' translated withCRs].