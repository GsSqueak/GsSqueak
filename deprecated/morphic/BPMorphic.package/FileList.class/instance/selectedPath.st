directory tree
selectedPath
	| _gsSqueakTemp_top _gsSqueakTemp_here |
	_gsSqueakTemp_top := FileDirectory root.
	_gsSqueakTemp_here := directory.
	^ (Array
		streamContents: [:s | 
			| next |
			s nextPut: _gsSqueakTemp_here.
			[next := _gsSqueakTemp_here containingDirectory.
			_gsSqueakTemp_top pathName = next pathName]
				whileFalse: [s nextPut: next.
					_gsSqueakTemp_here := next]]) reversed