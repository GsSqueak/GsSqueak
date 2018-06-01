multi-window support
multiWindowName
	"Answer the string to display for the receiver in a multi-window."
	^String streamContents:
		[:s| | str |
		self package
			ifNil: [s nextPut: $a; space; nextPutAll: self defaultBrowserTitle]
			ifNotNil:
				[:pkg|
				 self selectedClass
					ifNil: [self selectedSystemCategory
							ifNil: [s nextPutAll: pkg]
							ifNotNil: [:cat| s nextPutAll: cat]]
					ifNotNil:
						[:class|
						 s nextPutAll: pkg; space; print: class.
						 self metaClassIndicated ifTrue:
							[s nextPutAll: ' class']]].
		(str := self selectedMessageName) notNil
			ifTrue: [s nextPutAll: '>>'; nextPutAll: str]
			ifFalse:
				[(str := self selectedMessageCategoryName) notNil
					ifTrue: [s space; nextPut: ${; nextPutAll: str; nextPut: $}]]]