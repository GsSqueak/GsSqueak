menu
chooseEnvelope: choice
	| name |
	(choice beginsWith: 'edit ') ifTrue:
		[name := choice copyFrom: 'edit ' size+1 to: choice size.
		^ self editEnvelope: (sound envelopes detect:
				[:env | env name = name])].
	(choice beginsWith: 'add ') ifTrue:
		[name := choice copyFrom: 'add ' size+1 to: choice size.
		^ self addEnvelopeNamed: name].
	(choice beginsWith: 'remove ') ifTrue:
		[^ self removeEnvelope  "the current one"].
