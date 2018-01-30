bit manipulation
bitAnd: arg 
	"Primitive. Answer an Integer whose bits are the logical OR of the
	receiver's bits and those of the argument, arg.
	Numbers are interpreted as having 2's-complement representation.
	Essential.  See Object documentation whatIsAPrimitive."

	<primitive: 14>
	self >= 0 ifTrue: [^ arg bitAnd: self].
	^ arg < 0
		ifTrue: [(arg bitInvert bitOr: self bitInvert) bitInvert]
		ifFalse: [arg bitClear: self bitInvert]