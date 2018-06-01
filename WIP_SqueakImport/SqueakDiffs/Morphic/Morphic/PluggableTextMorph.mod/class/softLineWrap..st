preferences
softLineWrap: aBoolean

	aBoolean == SoftLineWrap ifTrue: [^ self].
	SoftLineWrap := aBoolean.
	PluggableTextMorph allSubInstancesDo: [:m |
		m text lineCount > 1 ifTrue: [m wrapFlag: aBoolean]].