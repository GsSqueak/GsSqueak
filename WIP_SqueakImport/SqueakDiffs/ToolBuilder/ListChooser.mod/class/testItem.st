examples
testItem
	^ self 
		chooseItemFrom: (Smalltalk classNames , Smalltalk traitNames) asOrderedCollection
		title: 'Pick a class'