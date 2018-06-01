plugin primitive support
is: oop MemberOf: className 
	"Support for external primitives"
	| _gsSqueakTemp_oopClass |
	_gsSqueakTemp_oopClass := objectMemory fetchClassOf: oop.
	^ self classNameOf: _gsSqueakTemp_oopClass Is: className