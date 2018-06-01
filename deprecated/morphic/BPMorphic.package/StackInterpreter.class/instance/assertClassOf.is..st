utilities
assertClassOf: oop is: classOop 
	"Succeed if oop is an instance of the given class. Fail if the object is an
	integer. "
	| _gsSqueakTemp_ok |
	_gsSqueakTemp_ok := objectMemory isNonImmediate: oop.
	_gsSqueakTemp_ok
		ifTrue: [_gsSqueakTemp_ok := objectMemory isClassOfNonImm: oop equalTo: classOop].
	self success: _gsSqueakTemp_ok