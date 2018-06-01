defaults
askForDefault

	self registeredClasses isEmpty ifTrue:
		[self inform: 'There are no ', self appName, ' applications registered.'.
		^ default := nil].
	self registeredClasses size = 1 ifTrue:
		[^ default := self registeredClasses anyOne].
	default :=  UIManager default 
		chooseFrom: (self registeredClasses collect: [:ea | ea nameForViewer])
		values: self registeredClasses
		title: 'Which ', self appName, ' would you prefer?'.
	default ifNil: [default := self registeredClasses first].
	^default.