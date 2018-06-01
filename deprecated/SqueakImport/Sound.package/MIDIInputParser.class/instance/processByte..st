private-state machine
processByte: aByte
	"Process the given incoming MIDI byte and record completed commands."
	"Details: Because this must be fast, it has been hand-tuned. Be careful!"

	aByte > 247 ifTrue: [  "real-time message; can arrive at any time"
		^ self perform: (cmdActionTable at: aByte) with: aByte].

	#idle = state ifTrue: [
		aByte >= 128
			ifTrue: [  "command byte in idle state: start new command"
				^ self perform: (cmdActionTable at: aByte) with: aByte]
			ifFalse: [  "data byte in idle state: use running status if possible"
				lastCmdByte ifNil: [^ self].  "running status unknown; skip byte"
				"process this data as if it had the last command byte in front of it"
				 self perform: lastSelector with: lastCmdByte.

				"the previous line put us into a new state; we now 'fall through'
				 to process the data byte given this new state."]].

	#ignore1 = state ifTrue: [^ state := #idle].
	#ignore2 = state ifTrue: [^ state := #ignore1].

	#want1of2 = state ifTrue: [
		argByte1 := aByte.
		^ state := #want2of2].

	#want2of2 = state ifTrue: [
		argByte2 := aByte.
		received addLast: (Array with: timeNow with: lastCmdByte with: argByte1 with: argByte2).
		^ state := #idle].

	#want1only = state ifTrue: [
		argByte1 := aByte.
		received addLast: (Array with: timeNow with: lastCmdByte with: argByte1).
		^ state := #idle].

	#sysExclusive = state ifTrue: [
		aByte < 128 ifTrue: [
			"record a system exclusive data byte"
			ignoreSysEx ifFalse: [sysExBuffer nextPut: aByte].
			^ self]
		ifFalse: [
			aByte < 248 ifTrue: [
				"a system exclusive message is terminated by any non-real-time command byte"
				ignoreSysEx ifFalse: [
					received addLast: (Array with: timeNow with: lastCmdByte with: sysExBuffer contents)].
				state := #idle.
				aByte = 247
					ifTrue: [^ self]							"endSysExclusive command, nothing left to do"
					ifFalse: [^ self processByte: aByte]]]].  	"no endSysExclusive; just start the next command"
