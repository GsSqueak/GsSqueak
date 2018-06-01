updating
update: what

	super update: what.
		
	getColorSelector ifNotNil: [:sel |
		what == sel ifTrue: [self offColor: (model perform: sel)]].

	getEnabledSelector ifNotNil: [:sel |
		what == sel ifTrue: [self enabled: (model perform: sel)]].

	updateMap ifNotNil:
		[(updateMap at: what ifAbsent: [])
			ifNotNil: [ :newTarget | self update: newTarget]].
