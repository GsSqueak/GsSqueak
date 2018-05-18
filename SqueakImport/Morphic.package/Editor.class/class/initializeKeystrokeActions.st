class initialization
initializeKeystrokeActions
	"Initialize the table for regular (i.e. non-command) keystroke dispatch"
	"
	self initializeKeystrokeActions
	"
	| actions |
	actions := Array new: 256 withAll: #normalCharacter:.
	0 to: 31 do: [ :i | actions at: i+1 put: #noop: ].
	actions at: 1 + 1 put: #cursorHome:.				"home key"
	actions at: 3 + 1 put: #enter:.						"enter / return key"
	actions at: 4 + 1 put: #cursorEnd:.				"end key"
	actions at: 5 + 1 put: #noop:.						"insert key"
	actions at: 8 + 1 put: #backspace:.				"macDelete winBackspace key"
	actions at: 9 + 1 put: #normalCharacter:.		"tab"
	actions at: 11 + 1 put: #cursorPageUp:.			"page up key"
	actions at: 12 + 1 put: #cursorPageDown:.		"page down key"
	actions at: 13 + 1 put: #enter:.					"enter / return key"
	actions at: 27 + 1 put: #offerMenuFromEsc:.	"escape key"
	actions at: 28 + 1 put: #cursorLeft:.				"left arrow key"
	actions at: 29 + 1 put: #cursorRight:.				"right arrow key"
	actions at: 30 + 1 put: #cursorUp:.				"up arrow key"
	actions at: 31 + 1 put: #cursorDown:.			"down arrow key"
	actions at: 127 + 1 put: #forwardDelete:.		"winDelete key"
	KeystrokeActions := actions