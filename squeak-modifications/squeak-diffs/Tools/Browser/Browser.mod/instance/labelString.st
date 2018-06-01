initialize-release
labelString
	| label |
	label := self selectedClassName
				ifNil: [ self defaultBrowserTitle ]
				ifNotNil: [ self defaultBrowserTitle, ': ', self selectedClassName asString ].
	(self multiWindowState notNil
	 and: [self multiWindowState models size > 1]) ifTrue:
		[label := (self multiWindowState models indexOf: self) printString, '. ', label].
	^label