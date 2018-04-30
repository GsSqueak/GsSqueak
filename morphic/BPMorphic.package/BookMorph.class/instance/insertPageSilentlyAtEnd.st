insert and delete
insertPageSilentlyAtEnd
	"Create a new page at the end of the book. Do not turn to it."
	| _gsSqueakTemp_sz _gsSqueakTemp_newPage _gsSqueakTemp_bw _gsSqueakTemp_bc _gsSqueakTemp_cc |
	_gsSqueakTemp_cc := currentPage isNil
				ifTrue: [_gsSqueakTemp_sz := pageSize.
					_gsSqueakTemp_bw := 0.
					_gsSqueakTemp_bc := Color blue muchLighter.
					color]
				ifFalse: [_gsSqueakTemp_sz := currentPage extent.
					_gsSqueakTemp_bw := currentPage borderWidth.
					_gsSqueakTemp_bc := currentPage borderColor.
					currentPage color].
	newPagePrototype
		ifNil: [_gsSqueakTemp_newPage := PasteUpMorph new extent: _gsSqueakTemp_sz;
						 color: _gsSqueakTemp_cc.
			_gsSqueakTemp_newPage borderWidth: _gsSqueakTemp_bw;
				 borderColor: _gsSqueakTemp_bc]
		ifNotNil: [_gsSqueakTemp_newPage := Cursor wait
						showWhile: [newPagePrototype veryDeepCopy]].
	_gsSqueakTemp_newPage setNameTo: self defaultNameStemForNewPages.
	_gsSqueakTemp_newPage vResizeToFit: false.
	pages isEmpty
		ifTrue: [pages add: (currentPage := _gsSqueakTemp_newPage)
			"had been none"]
		ifFalse: [pages add: _gsSqueakTemp_newPage after: pages last].
	^ _gsSqueakTemp_newPage