system control primitives
primitiveUTCMicrosecondClock
	"Answer the UTC microseconds since the Smalltalk epoch. The value is
	derived from the Posix epoch (see primitiveUTCMicrosecondClock) with a
	constant offset corresponding to elapsed microseconds between the two
	epochs according to RFC 868."
	| clock offset epochDelta uSecs |

	<export: true>
	<var: #clock type: 'sqLong'>
	<var: #offset type: 'int'>
	<var: #epochDelta declareC: 'static usqLong epochDelta= 2177452800000000ULL'>
	(self cCode: 'ioUtcWithOffset(&clock, &offset)' inSmalltalk: [-1]) = -1
		ifTrue: [^ self primitiveFail].
	clock := clock + epochDelta.
	uSecs := self positive64BitIntegerFor: clock.
	self pop: 1 thenPush: uSecs.
