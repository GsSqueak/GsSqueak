navigation
ensureSuitableDefaults

	listOfPages ifNil: [listOfPages := OrderedCollection new].
	currentIndex ifNil: [currentIndex := 0].

