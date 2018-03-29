plugin primitive support
is: oop KindOfClass: aClass 
	"Support for external primitives."
	| _gsSqueakTemp_oopClass |
	_gsSqueakTemp_oopClass := objectMemory fetchClassOf: oop.
	[_gsSqueakTemp_oopClass = objectMemory nilObject]
		whileFalse: [_gsSqueakTemp_oopClass = aClass
				ifTrue: [^ true].
			_gsSqueakTemp_oopClass := self superclassOf: _gsSqueakTemp_oopClass].
	^ false