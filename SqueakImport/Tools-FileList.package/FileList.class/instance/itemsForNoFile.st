file list menu
itemsForNoFile

	| services |
	services := OrderedCollection new.
	services add: self serviceSortByName.
	services add: self serviceSortBySize.
	services add: (self serviceSortByDate useLineAfter: true).
	services addAll: (self itemsForDirectory: (self isFileSelected ifFalse: [ self directory ] ifTrue: [])).
	^ services

		