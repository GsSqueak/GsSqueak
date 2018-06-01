initialization
addTabForBook: aBook withBalloonText: text
	| aTab |
	aTab := tabsMorph addTabForBook: aBook.
	pages add: aBook.
	currentPage ifNil: [currentPage := aBook].
	text ifNotNil: [aTab setBalloonText: text].
	^ aTab