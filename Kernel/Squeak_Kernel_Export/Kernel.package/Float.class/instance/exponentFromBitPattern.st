truncation and round off
exponentFromBitPattern
	"Extract the exponent from the bit pattern.
	This is used only when primitive fails"
	
	| exponent word1 |
	self isFinite ifFalse: [^self error: 'cannot take the exponent of non finite Float'].
	self = 0.0 ifTrue: [^-1].
	word1 := self basicAt: 1.
	exponent := (word1 bitShift: -20) bitAnd: 16r7FF.
	^exponent = 0
		ifTrue:
			[| high |
			high := (word1 bitAnd: 16rFFFFF) highBit.
			high := high = 0
				ifTrue: [(self basicAt: 2) highBit]
				ifFalse: [high + 32].
			self class emin - self class precision + high]
		ifFalse:
			[exponent + self class emin - 1]