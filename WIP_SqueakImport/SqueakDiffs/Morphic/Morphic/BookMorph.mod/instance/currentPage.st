accessing
currentPage
	(submorphs includes: currentPage) ifFalse: [currentPage := nil].
	^ currentPage