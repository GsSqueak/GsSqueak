accessing
askForDefault
	"Ask for the default implementor"
	self registeredClasses isEmpty
		ifTrue: [^ default := nil].
	self registeredClasses size = 1
		ifTrue: [^ default := self registeredClasses anyOne].
	default := UIManager default
				chooseFrom: (self registeredClasses
						collect: [:each | each name printString])
				values: self registeredClasses
				title: 'Which ' , self appName , ' would you prefer?'.
	^ default