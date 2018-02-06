keyboard
kbdTest
	"Sensor kbdTest"
	"This test routine will print the unmodified character, its keycode,
	and the OR of all its modifier bits, until the character x is typed"
	| _gsSqueakTemp_char _gsSqueakTemp_evt |
	_gsSqueakTemp_char := nil.
	[_gsSqueakTemp_char = $x]
		whileFalse: [[(_gsSqueakTemp_evt := self peekKeyboardEvent) isNil] whileTrue.
			_gsSqueakTemp_char := self characterForKeycode: _gsSqueakTemp_evt third.
			(String
				streamContents: [:s | 
					s nextPut: _gsSqueakTemp_char.
					(3 to: 8)
						with: 'cpmurw'
						do: [:i :c | s space; nextPut: c; nextPut: $:;
								print: (_gsSqueakTemp_evt at: i); nextPutAll: '     ']])
				displayAt: 10 @ 10]