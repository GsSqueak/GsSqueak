keyboard shortcut tables
initializeCmdKeyShortcuts
	"Initialize the (unshifted) command-key (or alt-key) shortcut table."
	"NOTE: if you don't know what your keyboard generates, use Sensor
	kbdTest "
	"SmalltalkEditor initialize"
	| _gsSqueakTemp_cmds |
	super initializeCmdKeyShortcuts.
	_gsSqueakTemp_cmds := #($b #browseIt: $d #doIt: $i #inspectIt: $l #cancel: $m #implementorsOfIt: $n #sendersOfIt: $o #spawnIt: $p #printIt: $q #querySymbol: $s #save: ).
	1
		to: _gsSqueakTemp_cmds size
		by: 2
		do: [:i | cmdActions
				at: (_gsSqueakTemp_cmds at: i) asciiValue + 1
				put: (_gsSqueakTemp_cmds at: i + 1)].
	"Set up type-method argument hot keys, 1-4.."
	'1234'
		do: [:eachKeyboardChar | cmdActions at: eachKeyboardChar asciiValue + 1 put: #typeMethodArgument:]