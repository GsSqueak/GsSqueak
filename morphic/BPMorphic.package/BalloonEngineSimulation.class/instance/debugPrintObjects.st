debug support
debugPrintObjects
	| _gsSqueakTemp_object _gsSqueakTemp_end |
	_gsSqueakTemp_object := 0.
	_gsSqueakTemp_end := objUsed.
	[_gsSqueakTemp_object < _gsSqueakTemp_end]
		whileTrue: [Transcript cr; nextPut: $#; print: _gsSqueakTemp_object; space;
				print: (self objectHeaderOf: _gsSqueakTemp_object); space.
			(self isEdge: _gsSqueakTemp_object)
				ifTrue: [Transcript nextPutAll: '(edge) '].
			(self isFill: _gsSqueakTemp_object)
				ifTrue: [Transcript nextPutAll: '(fill) '].
			Transcript
				print: (self objectLengthOf: _gsSqueakTemp_object);
				 space.
			Transcript endEntry.
			_gsSqueakTemp_object := _gsSqueakTemp_object
						+ (self objectLengthOf: _gsSqueakTemp_object)]