note controls
duration: denom onOff: ignored    "denom = eg, 1, 2, 4, 8, 16"
	"Set the duration of notes to be emitted when a key is pressed."

	self allMorphsDo:
		[:m | ((m isMemberOf: SimpleSwitchMorph)
				and: [m actionSelector == #duration:onOff:])
				ifTrue: [m setSwitchState: m arguments first = denom]].
	duration := denom.
	self durMod: #normal onOff: true