handles
addViewingHandle: haloSpec
	"If appropriate, add a special Viewing halo handle to the receiver.  On 26 Sept 07, we decided to eliminate this item from the UI, so the code of is method is now commented out...

	(innerTarget isKindOf: PasteUpMorph) ifTrue:
		[self addHandle: haloSpec
				on: #mouseDown send: #presentViewMenu to: innerTarget].
"
