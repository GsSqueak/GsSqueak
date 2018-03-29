plugin primitive support
is: oop KindOf: className 
	"Support for external primitives."
	| _gsSqueakTemp_oopClass |
	_gsSqueakTemp_oopClass := objectMemory fetchClassOf: oop.
	[_gsSqueakTemp_oopClass = objectMemory nilObject]
		whileFalse: [(self classNameOf: _gsSqueakTemp_oopClass Is: className)
				ifTrue: [^ true].
			_gsSqueakTemp_oopClass := self superclassOf: _gsSqueakTemp_oopClass].
	^ false