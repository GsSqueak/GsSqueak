examples
testIndex
	^ self 
		chooseIndexFrom: (Smalltalk classNames , Smalltalk traitNames) asOrderedCollection
		title: 'Pick a class'