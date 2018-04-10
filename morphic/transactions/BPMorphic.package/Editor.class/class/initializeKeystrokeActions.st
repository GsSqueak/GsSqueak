class initialization
initializeKeystrokeActions
	"Initialize the table for regular (i.e. non-command) keystroke dispatch"
	"
	self initializeKeystrokeActions
	"
	| _gsSqueakTemp_actions |
	_gsSqueakTemp_actions := Array new: 256 withAll: #normalCharacter:.
	0
		to: 31
		do: [:i | _gsSqueakTemp_actions at: i + 1 put: #noop:].
	_gsSqueakTemp_actions at: 1 + 1 put: #cursorHome:.
	"home key"
	_gsSqueakTemp_actions at: 3 + 1 put: #enter:.
	"enter / return key"
	_gsSqueakTemp_actions at: 4 + 1 put: #cursorEnd:.
	"end key"
	_gsSqueakTemp_actions at: 5 + 1 put: #noop:.
	"insert key"
	_gsSqueakTemp_actions at: 8 + 1 put: #backspace:.
	"macDelete winBackspace key"
	_gsSqueakTemp_actions at: 9 + 1 put: #normalCharacter:.
	"tab"
	_gsSqueakTemp_actions at: 11 + 1 put: #cursorPageUp:.
	"page up key"
	_gsSqueakTemp_actions at: 12 + 1 put: #cursorPageDown:.
	"page down key"
	_gsSqueakTemp_actions at: 13 + 1 put: #enter:.
	"enter / return key"
	_gsSqueakTemp_actions at: 27 + 1 put: #offerMenuFromEsc:.
	"escape key"
	_gsSqueakTemp_actions at: 28 + 1 put: #cursorLeft:.
	"left arrow key"
	_gsSqueakTemp_actions at: 29 + 1 put: #cursorRight:.
	"right arrow key"
	_gsSqueakTemp_actions at: 30 + 1 put: #cursorUp:.
	"up arrow key"
	_gsSqueakTemp_actions at: 31 + 1 put: #cursorDown:.
	"down arrow key"
	_gsSqueakTemp_actions at: 127 + 1 put: #forwardDelete:.
	"winDelete key"
	KeystrokeActions := _gsSqueakTemp_actions