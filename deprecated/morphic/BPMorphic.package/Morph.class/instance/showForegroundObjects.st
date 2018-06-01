-Etoys-card in a stack
showForegroundObjects
	"Temporarily highlight the foreground objects"
	self isStackBackground
		ifFalse: [^ self].
	Display
		restoreAfter: [self
				submorphsDo: [:aMorph | aMorph renderedMorph isShared
						ifFalse: [Display
								border: (aMorph fullBoundsInWorld insetBy: -6)
								width: 6
								rule: Form over
								fillColor: Color orange]]]