as yet unclassified
processMIDI
	"Process some MIDI commands. Answer true if any commands were processed."

	| didSomething |
	didSomething := false.
	midiParser midiDo: [:item | | cmdByte byte1 chan cmd byte2 |
		didSomething := true.
		cmdByte := item at: 2.
		byte1 := byte2 := nil.
		item size > 2 ifTrue: [
			byte1 := item at: 3.
			item size > 3 ifTrue: [byte2 := item at: 4]].
		cmdByte < 240
			ifTrue: [  "channel message" 
				cmd := cmdByte bitAnd: 2r11110000.
				chan := (cmdByte bitAnd: 2r00001111) + 1.
				(channels at: chan) doChannelCmd: cmd byte1: byte1 byte2: byte2]
			ifFalse: [  "system message"
				"process system messages here"
			]].
	^ didSomething
