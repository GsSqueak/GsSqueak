preferences
useColorfulWindows: aBoolean

	UseColorfulWindows = aBoolean ifTrue: [^ self].
	UseColorfulWindows := aBoolean.

	(Smalltalk classNamed: #SystemWindow) ifNotNil: [:c | c refreshAllWindows].
	(Smalltalk classNamed: #TheWorldMainDockingBar) ifNotNil: [:c | c updateInstances].