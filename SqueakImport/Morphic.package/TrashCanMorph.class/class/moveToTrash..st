miscellaneous
moveToTrash: aMorph
	SoundService soundEnabled ifTrue:
		[TrashCanMorph preserveTrash 
			ifFalse: [self playSoundNamed: 'scratch']
			ifTrue: [self playDeleteSound]].

	aMorph delete.
	aMorph == ScrapBook default scrapBook ifFalse:
		[ScrapBook default addToTrash: aMorph]