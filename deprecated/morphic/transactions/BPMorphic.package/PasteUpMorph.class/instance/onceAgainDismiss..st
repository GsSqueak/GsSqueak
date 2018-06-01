undo
onceAgainDismiss: aMorph 
	"Occasioned by a redo of a dismiss-via-halo"
	aMorph dismissMorph.
	TrashCanMorph preserveTrash
		ifTrue: [TrashCanMorph slideDismissalsToTrash
				ifTrue: [aMorph slideToTrash: nil]
				ifFalse: [TrashCanMorph moveToTrash: aMorph]]