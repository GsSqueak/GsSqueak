initialization
ensureSuitableDefaults

	listOfPages ifNil: [
		listOfPages := Project allMorphicProjects collect: [ :each | {each name}].
		threadName := 'all (default)' translated.
		self class know: listOfPages as: threadName.
	].
	currentIndex ifNil: [currentIndex := 0].
