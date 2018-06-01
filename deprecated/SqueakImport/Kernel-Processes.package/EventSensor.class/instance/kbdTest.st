keyboard
kbdTest    "Sensor kbdTest"
	"This test routine will print the unmodified character, its keycode,
	and the OR of all its modifier bits, until the character x is typed"
	| char evt |
	char := nil.
	[char = $x] whileFalse: 
		[[(evt := self peekKeyboardEvent) isNil] whileTrue.
		char := self characterForKeycode: evt third.
		(String streamContents: 
			[:s |
			s nextPut: char.
			(3 to: 8) with: 'cpmurw' do:
				[:i :c|
				s space; nextPut: c; nextPut: $:; print: (evt at: i); nextPutAll: '     ']])
			displayAt: 10@10]