keyboard
characterForKeycode: keycode 
	"Map the given keycode to a Smalltalk character object. Encoding:
	A keycode is 12 bits: <4 modifer bits><8 bit ISO character>
	Modifier bits are: <command><option><control><shift>"
	"NOTE: the command and option keys are specific to the Macintosh
	and may not have equivalents on other platforms."
	keycode = nil
		ifTrue: [^ nil].
	keycode class = Character
		ifTrue: [^ keycode].
	"to smooth the transition!"
	^ Character
		value: (keycode bitAnd: 255)