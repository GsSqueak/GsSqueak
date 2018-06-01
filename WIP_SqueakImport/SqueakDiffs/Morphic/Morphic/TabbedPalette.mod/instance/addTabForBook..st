initialization
addTabForBook: aBook
	| aTab |
	aTab := tabsMorph addTabForBook: aBook.
	pages add: aBook.
	currentPage ifNil: [currentPage := aBook].
	^ aTab