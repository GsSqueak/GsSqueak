*SqNumbers-printing
printString
	"Reimplementation - Number 'printing' method."
	| tempStream |
	tempStream := WriteStream on: (String new: 10).
	self printOn: tempStream.
	^ tempStream contents
