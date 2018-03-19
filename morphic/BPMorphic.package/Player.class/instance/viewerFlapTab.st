misc
viewerFlapTab
	"If a viewer in a flap exists for me, return it."
	(costume world
		ifNil: [self currentWorld])
		submorphsDo: [:mm | (mm isKindOf: ViewerFlapTab)
				ifTrue: [mm scriptedPlayer == self
						ifTrue: [^ mm]]].
	^ nil