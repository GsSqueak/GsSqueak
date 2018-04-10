layout
acceptDroppingMorph: aMorph event: evt 
	SoundService soundEnabled
		ifTrue: [TrashCanMorph preserveTrash
				ifTrue: [self class playDeleteSound]
				ifFalse: [self playSoundNamed: 'scratch']].
	evt hand visible: true.
	self state: #off.
	aMorph delete.
	aMorph == ScrapBook default scrapBook
		ifFalse: [ScrapBook default addToTrash: aMorph removeHalo]