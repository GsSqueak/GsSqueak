enumerating
changeSet: aChangeSet containsClass: aClass
	| theClass |
	theClass := Smalltalk classNamed: aClass.
	theClass ifNil: [^ false].
	^ aChangeSet containsClass: theClass