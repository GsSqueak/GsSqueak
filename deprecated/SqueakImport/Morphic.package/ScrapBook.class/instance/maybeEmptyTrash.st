scraps
maybeEmptyTrash
	(self confirm: 'Do you really want to empty the trash?' translated)
		ifTrue: [self emptyScrapBook]