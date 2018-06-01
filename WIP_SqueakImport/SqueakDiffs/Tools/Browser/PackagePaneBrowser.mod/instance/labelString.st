initialize-release
labelString
	^self package
		ifNil: [super labelString]
		ifNotNil:
			[:pkg| | label |
			label := self defaultBrowserTitle, ': ', pkg, (self selectedClass
														ifNil: ['']
														ifNotNil: [' ', self selectedClass printString]).
			(self multiWindowState notNil
			 and: [self multiWindowState models size > 1]) ifTrue:
				[label := (self multiWindowState models indexOf: self) printString, '. ', label].
			label]