initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""

	whiteKeyColor := Color gray: 0.95.
	blackKeyColor := Color black.
	playingKeyColor := Color red.
	nOctaves := 6.
	self buildKeyboard.
	soundPrototype := FMSound brass1 duration: 9.9.
	soundPrototype := FMSound new.
