submorphs-accessing
allSubmorphNamesDo: nameBlock
	"Return a list of all known names of submorphs and nested submorphs of the receiver, based on the scope of the receiver.  Items in parts bins are excluded"

	self isPartsBin ifTrue: [^ self]. "Don't report names from parts bins"
	self submorphsDo: 
		[:m | m knownName ifNotNil: [:n | nameBlock value: n].
		m allSubmorphNamesDo: nameBlock].
