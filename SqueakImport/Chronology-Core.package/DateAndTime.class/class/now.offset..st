squeak protocol
now: clockValue offset: aDuration

	| seconds nanos |
	"Ensure that consecutive sends of this method return increasing values, by adding small values to the nanosecond part of the created object. The next few lines are assumed to be executed atomically - having no suspension points."
	((LastClockValue ifNil: [ 0 ]) digitCompare: clockValue) = 0
		ifTrue: [ NanoOffset := NanoOffset + 1 ]
		ifFalse: [ NanoOffset := 0 ].
	LastClockValue := clockValue.
	nanos := clockValue \\ 1000000 * 1000 + NanoOffset.
	seconds := clockValue // 1000000.
	^self basicNew
		setJdn: seconds // SecondsInDay + SqueakEpoch
		seconds: seconds \\ SecondsInDay
		nano: nanos
		offset: aDuration