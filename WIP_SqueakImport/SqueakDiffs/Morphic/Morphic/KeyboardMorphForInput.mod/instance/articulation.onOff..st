note controls
articulation: artic onOff: ignored    "artic = eg, #legato, #normal, #staccato."
	"Set the articulation of notes to be emitted when a key is pressed."

	self allMorphsDo:
		[:m | ((m isMemberOf: SimpleSwitchMorph)
				and: [m actionSelector == #articulation:onOff:])
				ifTrue: [m setSwitchState: m arguments first == artic]].
	articulation := artic