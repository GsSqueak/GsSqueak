accessing
icon
	"Answer a form to be used as icon"
	^ item isRemoteDirectory
		ifTrue: [MenuIcons smallRemoteOpenIcon]
		ifFalse: [MenuIcons smallOpenIcon]