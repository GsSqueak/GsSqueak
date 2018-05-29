note controls
durMod: durMod onOff: ignored    "durMod = eg, #dotted, #normal, #triplets, #quints"
	"Set the duration of notes to be emitted when a key is pressed."

	self allMorphsDo:
		[:m | ((m isMemberOf: SimpleSwitchMorph)
				and: [m actionSelector == #durMod:onOff:])
				ifTrue: [m setSwitchState: m arguments first = durMod]].
	durationModifier := durMod