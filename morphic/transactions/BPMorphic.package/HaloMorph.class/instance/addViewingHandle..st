handles
addViewingHandle: haloSpec 
	"If appropriate, add a special Viewing halo handle to the receiver"
	(innerTarget isKindOf: PasteUpMorph)
		ifTrue: [self
				addHandle: haloSpec
				on: #mouseDown
				send: #presentViewMenu
				to: innerTarget]