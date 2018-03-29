debug printing
printProcsOnList: procList 
	| _gsSqueakTemp_proc _gsSqueakTemp_firstProc |
	_gsSqueakTemp_proc := _gsSqueakTemp_firstProc := objectMemory followField: FirstLinkIndex ofObject: procList.
	[_gsSqueakTemp_proc = objectMemory nilObject]
		whileFalse: [self printProcessStack: _gsSqueakTemp_proc.
			_gsSqueakTemp_proc := objectMemory followField: NextLinkIndex ofObject: _gsSqueakTemp_proc.
			_gsSqueakTemp_proc = _gsSqueakTemp_firstProc
				ifTrue: [self warning: 'circular process list!!'.
					^ nil]]