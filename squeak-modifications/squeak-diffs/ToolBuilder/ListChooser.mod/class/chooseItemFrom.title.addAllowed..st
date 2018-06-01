instance creation
chooseItemFrom: aList title: aString addAllowed: aBoolean
	^ self new
		chooseItemFrom: aList 
		title: (aString isEmptyOrNil ifTrue: [ self defaultTitle ] ifFalse: [ aString ])
		addAllowed: aBoolean