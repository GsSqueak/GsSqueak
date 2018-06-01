printing
keyName
	"Return a note name for my pitch."

	| pitchName octave |
	pitchName := #(c cs d ef e f fs g af a bf b) at: (midiKey \\ 12) + 1.
	octave := (#(-1 0 1 2 3 4 5 6 7 8 9) at: (midiKey // 12) + 1) printString.
	^ pitchName, octave
