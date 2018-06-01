as yet unclassified
patchOldVersion1

	"hack.. use this as an opportunity to fix old versions"
	self allMorphsDo: [:m |
		((m isKindOf: UpdatingStringMorph) and: [m getSelector == #cameraPoint]) ifTrue: [
			m getSelector: #cameraPointRounded
		].
	].

