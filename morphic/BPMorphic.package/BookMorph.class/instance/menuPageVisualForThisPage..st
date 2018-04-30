menu
menuPageVisualForThisPage: evt 
	currentPage
		ifNotNil: [^ self menuPageVisualFor: currentPage event: evt]