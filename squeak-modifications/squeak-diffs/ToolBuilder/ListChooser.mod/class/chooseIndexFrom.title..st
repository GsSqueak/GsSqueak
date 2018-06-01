instance creation
chooseIndexFrom: aList title: aString
	^ self
		chooseIndexFrom: aList 
		title: (aString isEmptyOrNil ifTrue: [ self defaultTitle ] ifFalse: [ aString ])
		addAllowed: false