FIXME
ioUTCMicroseconds
	"Answer the UTC microseconds since the Smalltalk epoch. The value is
	derived from the Posix epoch (see primitiveUTCMicrosecondClock) with a
	constant offset corresponding to elapsed microseconds between the two
	epochs according to RFC 868."

	"Added to Cross/vm/sqVirtualMachine but incompatible with existing timer
	support in Cross. Implemented here to provide the function not present in
	the support code. See also primitiveUTCMicrosecondClock."

	| clock offset epochDelta |
	<export: true>
	<returnTypeC: 'usqLong'>
	<var: #clock type: 'sqLong'>
	<var: #offset type: 'int'>
	<var: #epochDelta declareC: 'static usqLong epochDelta= 2177452800000000ULL'>

	self flag: #FIXME. "remove this method when platform sources are reconciled"

	(self cCode: 'ioUtcWithOffset(&clock, &offset)' inSmalltalk: [-1]) = -1
		ifTrue: [^ self primitiveFail].
	^clock + epochDelta.
