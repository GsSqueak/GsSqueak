midi filtering
ignoreCommand: midiCmd
	"Don't record the given MIDI command on any channel."

	| cmd sel | 
	((midiCmd isInteger not) | (midiCmd < 128) | (midiCmd > 255))
		ifTrue: [^ self error: 'bad MIDI command'].

	midiCmd < 240 ifTrue: [  "channel commands; ignore on all channels"
		cmd := midiCmd bitAnd: 2r11110000.
		sel := (#(128 144 160 176 224) includes: cmd)
			ifTrue: [#ignoreTwo:]
			ifFalse: [#ignoreOne:].
		 1 to: 16 do: [:ch | cmdActionTable at: (cmd bitOr: ch - 1) put: sel].
		^ self].

	(#(240 241 244 245 247 249 253) includes: midiCmd) ifTrue: [
		^ self error: 'You can''t ignore the undefined MIDI command: ', midiCmd printString].

	midiCmd = 242 ifTrue: [  "two-arg command"
		cmdActionTable at: midiCmd put: #ignoreTwo:.
		 ^ self].

	midiCmd = 243 ifTrue: [  "one-arg command"
		cmdActionTable at: midiCmd put: #ignoreOne:.
		^ self].

	(#(246 248 250 251 252 254 255) includes: midiCmd) ifTrue:	[  "zero-arg command"
		cmdActionTable at: midiCmd put: #ignore.
		 ^ self].

	"we should not get here"
	self error: 'implementation error'.
