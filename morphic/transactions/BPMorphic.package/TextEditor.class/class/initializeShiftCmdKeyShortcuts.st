keyboard shortcut tables
initializeShiftCmdKeyShortcuts
	"Initialize the shift-command-key (or control-key) shortcut table."
	"NOTE: if you don't know what your keyboard generates, use Sensor
	kbdTest "
	"wod 11/3/1998: Fix setting of cmdMap for shifted keys to actually use
	the 
	capitalized versions of the letters.
	TPR 2/18/99: add the plain ascii values back in for those VMs that
	don't return the shifted values."
	"TextEditor initialize"
	"shift-command and control shortcuts"
	| _gsSqueakTemp_cmdMap _gsSqueakTemp_cmds |
	_gsSqueakTemp_cmdMap := Array new: 256 withAll: #noop:.
	"use temp in case of a crash"
	_gsSqueakTemp_cmdMap at: 1 + 1 put: #cursorHome:.
	"home key"
	_gsSqueakTemp_cmdMap at: 4 + 1 put: #cursorEnd:.
	"end key"
	_gsSqueakTemp_cmdMap at: 8 + 1 put: #forwardDelete:.
	"ctrl-H or delete key"
	_gsSqueakTemp_cmdMap at: 11 + 1 put: #cursorPageUp:.
	"page up key"
	_gsSqueakTemp_cmdMap at: 12 + 1 put: #cursorPageDown:.
	"page down key"
	_gsSqueakTemp_cmdMap at: 13 + 1 put: #crWithIndent:.
	"ctrl-Return"
	_gsSqueakTemp_cmdMap at: 27 + 1 put: #offerMenuFromEsc:.
	"escape key"
	_gsSqueakTemp_cmdMap at: 28 + 1 put: #cursorLeft:.
	"left arrow key"
	_gsSqueakTemp_cmdMap at: 29 + 1 put: #cursorRight:.
	"right arrow key"
	_gsSqueakTemp_cmdMap at: 30 + 1 put: #cursorUp:.
	"up arrow key"
	_gsSqueakTemp_cmdMap at: 31 + 1 put: #cursorDown:.
	"down arrow key"
	_gsSqueakTemp_cmdMap at: 32 + 1 put: #selectWord:.
	"space bar key"
	_gsSqueakTemp_cmdMap at: 45 + 1 put: #changeEmphasis:.
	"cmd-sh-minus"
	_gsSqueakTemp_cmdMap at: 61 + 1 put: #changeEmphasis:.
	"cmd-sh-plus"
	_gsSqueakTemp_cmdMap at: 127 + 1 put: #forwardDelete:.
	"del key"
	"On some keyboards, these characters require a shift"
	'([<{|"''9'
		do: [:char | _gsSqueakTemp_cmdMap at: char asciiValue + 1 put: #enclose:].
	"NB: sw 12/9/2001 commented out the idiosyncratic line just below,
	which was grabbing shift-esc in the text editor and hence which
	argued with the wish to have shift-esc be a universal gesture for
	escaping the local context and calling up the desktop menu."
	"cmdMap at: (27 + 1) put: #shiftEnclose:."
	"ctrl-["
	"'"
	"''(' do: [ :char | cmdMap at: (char asciiValue + 1) put: #enclose:]."
	_gsSqueakTemp_cmds := #($c #compareToClipboard: $h #cursorTopHome: $j #doAgainUpToEnd: $k #changeStyle: $m #selectCurrentTypeIn: $s #findAgain: $u #changeLfToCr: $x #makeLowercase: $y #makeUppercase: $z #redo: ).
	"makeCapitalized:"
	1
		to: _gsSqueakTemp_cmds size
		by: 2
		do: [:i | 
			_gsSqueakTemp_cmdMap
				at: (_gsSqueakTemp_cmds at: i) asciiValue + 1
				put: (_gsSqueakTemp_cmds at: i + 1).
			"plain keys"
			_gsSqueakTemp_cmdMap
				at: (_gsSqueakTemp_cmds at: i) asciiValue - 32 + 1
				put: (_gsSqueakTemp_cmds at: i + 1).
			"shifted keys"
			_gsSqueakTemp_cmdMap
				at: (_gsSqueakTemp_cmds at: i) asciiValue - 96 + 1
				put: (_gsSqueakTemp_cmds at: i + 1)].
	shiftCmdActions := _gsSqueakTemp_cmdMap