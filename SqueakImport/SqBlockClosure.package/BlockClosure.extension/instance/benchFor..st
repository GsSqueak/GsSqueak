*SqBlockClosure-evaluating
benchFor: aDuration
	"See how many times I can value within the given duration.  I'll answer a meaningful description."

	| startTime shouldRun count elapsedTime  roundTo3Digits delay |
	roundTo3Digits := [:num |
		| rounded lowDigit |
		rounded := (num * 1000) rounded. "round to 1/1000"
		lowDigit := (rounded numberOfDigitsInBase: 10) - 3. "keep only first 3 digits"
		rounded := rounded roundTo:(10 raisedTo: lowDigit).
		(lowDigit >= 3 or: [rounded \ 1000 = 0]) "display fractional part only when needed"
			ifTrue: [(rounded // 1000) asStringWithCommas]
			ifFalse: [(rounded / 1000.0) printString]].
	delay := aDuration asDelay.
	count := 0.
	shouldRun := true.
	[ delay wait. shouldRun := false ] forkAt: Processor timingPriority - 1.
	startTime := Time millisecondClockValue.
	[ shouldRun ] whileTrue: [ 
		self value.
		count := count + 1 ].
	elapsedTime := Time millisecondsSince: startTime.
	^(roundTo3Digits value: count * 1000 / elapsedTime) , ' per second.', ((
		#(
			(1e-3 'seconds')
			(1 'milliseconds')
			(1e3 'microseconds')
			(1e6 'nanoseconds')
		)
			detect: [ :pair | elapsedTime * pair first >= count ]
			ifNone: [ #(1e9 'picoseconds') ])
		in: [ :pair |
			' {1} {2} per run.' format: {
				(roundTo3Digits value: elapsedTime * pair first / count).
				pair second } ])
