examples
testItemAdd
	^ self 
		chooseItemFrom: (Smalltalk classNames , Smalltalk traitNames) asOrderedCollection
		title: 'Pick or Add:'
		addAllowed: true