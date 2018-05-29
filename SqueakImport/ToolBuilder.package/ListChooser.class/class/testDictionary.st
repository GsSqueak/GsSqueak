examples
testDictionary
	^ self 
		chooseItemFrom: (Dictionary newFrom: {#a->1. 2->#b.})
		title: 'Pick from Dictionary' "gives values, not keys"