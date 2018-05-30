menu
chooseFrom: chooserMorph envelopeItem: item
	| name |
	(item beginsWith: 'edit ') ifTrue:
		[name := item copyFrom: 'edit ' size+1 to: item size.
		self editEnvelope: (sound envelopes detect:
				[:env | env name = name])].
	(item beginsWith: 'add ') ifTrue:
		[name := item copyFrom: 'add ' size+1 to: item size.
		self addEnvelopeNamed: name].
	(item beginsWith: 'remove ') ifTrue:
		[self removeEnvelope  "the current one"].
	chooserMorph contentsClipped: envelope name