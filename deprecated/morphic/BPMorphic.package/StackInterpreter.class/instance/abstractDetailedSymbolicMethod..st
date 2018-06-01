debug support
abstractDetailedSymbolicMethod: aMethod 
	| _gsSqueakTemp_ts _gsSqueakTemp_prim |
	(_gsSqueakTemp_ts := self transcript) ensureCr.
	(_gsSqueakTemp_prim := self primitiveIndexOf: aMethod) > 0
		ifTrue: [_gsSqueakTemp_ts nextPutAll: '<primitive: ';
				 print: _gsSqueakTemp_prim;
				 nextPut: $>.
			(self isQuickPrimitiveIndex: _gsSqueakTemp_prim)
				ifTrue: [_gsSqueakTemp_ts nextPutAll: ' quick method';
						 cr;
						 flush.
					^ self].
			_gsSqueakTemp_ts cr].
	(RelativeDetailedInstructionPrinter
		on: (VMCompiledMethodProxy new
				for: aMethod
				coInterpreter: self
				objectMemory: objectMemory)) indent: 0;
		 printInstructionsOn: _gsSqueakTemp_ts.
	_gsSqueakTemp_ts flush