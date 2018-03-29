compiled methods
unfollow: litVar atIndex: literalIndex 
	"So rare it mustn't bulk up the common path"
	| _gsSqueakTemp_followed |
	_gsSqueakTemp_followed := objectMemory followForwarded: litVar.
	self
		literal: literalIndex
		ofMethod: method
		put: _gsSqueakTemp_followed.
	^ _gsSqueakTemp_followed