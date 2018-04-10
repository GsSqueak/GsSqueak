-Etoys-card in a stack
showBackgroundObjects
	"Momentarily highlight just the background objects on the current
	playfield "
	self isStackBackground
		ifFalse: [^ self].
	self invalidRect: self bounds.
	self currentWorld doOneCycle.
	Display
		restoreAfter: [self
				submorphsDo: [:aMorph | (aMorph renderedMorph hasProperty: #shared)
						ifTrue: [Display
								border: (aMorph fullBoundsInWorld insetBy: -6)
								width: 6
								rule: Form over
								fillColor: Color blue]]]