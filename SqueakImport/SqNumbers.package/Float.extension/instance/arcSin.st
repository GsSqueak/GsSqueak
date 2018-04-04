*SqNumbers-mathematical functions
arcSin
	"Answer the angle in radians."

	((self < -1.0) or: [self > 1.0]) ifTrue: [DomainError signal: 'arcSin only takes values between -1 and 1'].
	((self = -1.0) or: [self = 1.0])
		ifTrue: [^ Halfpi * self]
		ifFalse: [^ (self / (1.0 - (self * self)) sqrt) arcTan]
