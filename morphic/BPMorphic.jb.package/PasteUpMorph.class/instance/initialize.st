initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	cursor := 1.
	padding := 3.
	self enableDragNDrop.
	self isWorldMorph
		ifTrue: [self setProperty: #automaticPhraseExpansion toValue: true].
	self clipSubmorphs: true.
	self initializeKeyboardShortcuts