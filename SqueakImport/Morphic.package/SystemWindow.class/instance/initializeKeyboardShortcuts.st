initialization
initializeKeyboardShortcuts
	"Install an event capture filter to add shortcuts for window control operations."
	
	PasteUpMorph globalCommandKeysEnabled
		ifTrue: [self addKeyboardShortcuts].