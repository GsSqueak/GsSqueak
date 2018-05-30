accessing
widgetNamed: aString
	self name = aString
		ifTrue: [^ self]
		ifFalse: [self children do: [:ea | (ea widgetNamed: aString) ifNotNil: [:w | ^ w]]].
	^ nil