multi-window support
multiWindowName
	"Answer the string to display for the receiver in a multi-window."
	^String streamContents:
		[:s| | str |
		self selectedClass
			ifNil: [s nextPut: $a; space; nextPutAll: self defaultBrowserTitle]
			ifNotNil:
				[s print: self selectedClass.
				 self metaClassIndicated ifTrue:
					[s nextPutAll: ' class'].
				  self isHierarchy ifTrue:
					[s space; nextPutAll: ' Hierarchy']].
		(str := self selectedMessageName) notNil
			ifTrue: [s nextPutAll: '>>'; nextPutAll: str]
			ifFalse:
				[(str := self selectedMessageCategoryName) notNil
					ifTrue: [s space; nextPut: ${; nextPutAll: str; nextPut: $}]]]