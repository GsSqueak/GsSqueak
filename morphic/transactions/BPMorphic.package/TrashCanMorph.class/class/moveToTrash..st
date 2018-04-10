miscellaneous
moveToTrash: aMorph 
	SoundService soundEnabled
		ifTrue: [TrashCanMorph preserveTrash
				ifTrue: [self playDeleteSound]
				ifFalse: [self playSoundNamed: 'scratch']].
	aMorph delete.
	aMorph == ScrapBook default scrapBook
		ifFalse: [ScrapBook default addToTrash: aMorph]