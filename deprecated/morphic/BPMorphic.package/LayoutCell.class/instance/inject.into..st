collection
inject: thisValue into: binaryBlock 
	"Accumulate a running value associated with evaluating the
	argument, 
	binaryBlock, with the current value of the argument, thisValue, and
	the 
	receiver as block arguments. For instance, to sum the numeric
	elements 
	of a collection, aCollection inject: 0 into: [:subTotal :next | subTotal + 
	next]."
	| _gsSqueakTemp_nextValue |
	_gsSqueakTemp_nextValue := thisValue.
	self
		do: [:each | _gsSqueakTemp_nextValue := binaryBlock value: _gsSqueakTemp_nextValue value: each].
	^ _gsSqueakTemp_nextValue