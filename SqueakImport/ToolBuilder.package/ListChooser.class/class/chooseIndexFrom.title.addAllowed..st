instance creation
chooseIndexFrom: aList title: aString addAllowed: aBoolean
	^ self new
		chooseIndexFrom: aList 
		title: (aString isEmptyOrNil ifTrue: [ self defaultTitle ] ifFalse: [ aString ])
		addAllowed: aBoolean