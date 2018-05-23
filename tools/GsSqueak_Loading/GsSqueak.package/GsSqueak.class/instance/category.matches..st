testing
category: categoryOrPackage matches: category

	^ category = categoryOrPackage or: [
		(category findString: categoryOrPackage , $- startingAt: 1) = 1]