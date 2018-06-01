class initialization
initialize
	"Initialize the keyboard shortcut maps and the shared buffers
	for copying text across views and managing again and undo."
	"TextEditor initialize"
	FindText := ChangeText := Text new.
	self initializeCmdKeyShortcuts.
	self initializeShiftCmdKeyShortcuts.
	self initializeYellowButtonMenu.
	self initializeShiftedYellowButtonMenu