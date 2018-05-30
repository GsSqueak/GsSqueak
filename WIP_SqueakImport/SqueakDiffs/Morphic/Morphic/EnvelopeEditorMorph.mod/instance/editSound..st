initialization
editSound: aSound

	| p |
	(aSound respondsTo: #envelopes)
		ifFalse: [
			UIManager default inform: 'You selected a ', aSound class name, '.', String cr,
				'I can''t handle these kinds of sounds.'.
			^self ].
	sound := aSound.
	sound envelopes isEmpty ifTrue: [
		"provide a default volume envelope"
		p := OrderedCollection new.
		p add: 0@0.0; add: 10@1.0; add: 100@1.0; add: 120@0.0.
		sound addEnvelope: (VolumeEnvelope points: p loopStart: 2 loopEnd: 3)].

	self editEnvelope: sound envelopes first.
	keyboard soundPrototype: sound.
