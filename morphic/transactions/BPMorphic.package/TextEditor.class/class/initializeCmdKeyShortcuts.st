keyboard shortcut tables
initializeCmdKeyShortcuts
	"Initialize the (unshifted) command-key (or alt-key) shortcut table."
	"NOTE: if you don't know what your keyboard generates, use Sensor
	kbdTest "
	"TextEditor initialize"
	| _gsSqueakTemp_cmdMap _gsSqueakTemp_cmds |
	_gsSqueakTemp_cmdMap := Array new: 256 withAll: #noop:.
	"use temp in case of a crash"
	_gsSqueakTemp_cmdMap at: 1 + 1 put: #cursorHome:.
	"home key"
	_gsSqueakTemp_cmdMap at: 4 + 1 put: #cursorEnd:.
	"end key"
	_gsSqueakTemp_cmdMap at: 8 + 1 put: #backspace:.
	"ctrl-H or delete key"
	_gsSqueakTemp_cmdMap at: 11 + 1 put: #cursorPageUp:.
	"page up key"
	_gsSqueakTemp_cmdMap at: 12 + 1 put: #cursorPageDown:.
	"page down key"
	_gsSqueakTemp_cmdMap at: 13 + 1 put: #crWithIndent:.
	"cmd-Return"
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
	_gsSqueakTemp_cmdMap at: 127 + 1 put: #forwardDelete:.
	"del key"
	'0123456789-='
		do: [:char | _gsSqueakTemp_cmdMap at: char asciiValue + 1 put: #changeEmphasis:].
	'([<{|"'''
		do: [:char | _gsSqueakTemp_cmdMap at: char asciiValue + 1 put: #enclose:].
	_gsSqueakTemp_cmds := #($a #selectAll: $c #copySelection: $e #exchange: $f #find: $g #findAgain: $j #doAgain: $k #offerFontMenu: $u #align: $v #paste: $w #backWord: $x #cut: $y #swapChars: $z #undo: ).
	1
		to: _gsSqueakTemp_cmds size
		by: 2
		do: [:i | _gsSqueakTemp_cmdMap
				at: (_gsSqueakTemp_cmds at: i) asciiValue + 1
				put: (_gsSqueakTemp_cmds at: i + 1)].
	cmdActions := _gsSqueakTemp_cmdMap