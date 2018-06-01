label
tryToRenameTo: newLabel 
	"Triggered eg by typing a new name in the halo"
	newLabel isEmpty
		ifTrue: [^ self].
	(model windowReqNewLabel: newLabel)
		ifTrue: [self setLabel: newLabel]