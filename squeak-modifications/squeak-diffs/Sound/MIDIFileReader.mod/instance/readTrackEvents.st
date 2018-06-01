track reading
readTrackEvents
	"Read the events of the current track."

	| cmd chan key vel ticks byte length evt |
	cmd := #unknown.
	chan := key := vel := 0.
	ticks := 0.
	[trackStream atEnd] whileFalse: [
		ticks := ticks + (self readVarLengthIntFrom: trackStream).
		byte := trackStream next.
		byte >= 16rF0
			ifTrue: [  "meta or system exclusive event"
				byte = 16rFF ifTrue: [self metaEventAt: ticks].
				((byte = 16rF0) or: [byte = 16rF7]) ifTrue: [  "system exclusive data"
					length := self readVarLengthIntFrom: trackStream.
					trackStream skip: length].
				cmd := #unknown]
			ifFalse: [  "channel message event"
				byte >= 16r80
					ifTrue: [  "new command"
						cmd := byte bitAnd: 16rF0.
						chan := byte bitAnd: 16r0F.
						key := trackStream next]
					ifFalse: [  "use running status"
						cmd == #unknown
							ifTrue: [self error: 'undefined running status; bad MIDI file?'].
						key := byte].

				((cmd = 16rC0) or: [cmd = 16rD0]) ifFalse: [
					"all but program change and channel pressure have two data bytes"
					vel := trackStream next].

				cmd = 16r80 ifTrue: [  "note off"
					self endNote: key chan: chan at: ticks].

				cmd = 16r90 ifTrue: [  "note on"
					vel = 0
						ifTrue: [self endNote: key chan: chan at: ticks]
						ifFalse: [self startNote: key vel: vel chan: chan at: ticks]].

				"cmd = 16A0 -- polyphonic key pressure; skip"

				cmd = 16rB0 ifTrue: [
					evt := ControlChangeEvent new control: key value: vel channel: chan.
					evt time: ticks.
					track add: evt].

				cmd = 16rC0 ifTrue: [
					evt := ProgramChangeEvent new program: key channel: chan.
					evt time: ticks.
					track add: evt].

				"cmd = 16D0 -- channel aftertouch pressure; skip"

				cmd = 16rE0 ifTrue: [
					evt := PitchBendEvent new bend: key + (vel bitShift: 7) channel: chan.
					evt time: ticks.
					track add: evt]
	]].
