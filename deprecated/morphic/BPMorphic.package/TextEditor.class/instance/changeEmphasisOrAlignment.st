attributes
changeEmphasisOrAlignment
	| _gsSqueakTemp_aList _gsSqueakTemp_reply _gsSqueakTemp_code _gsSqueakTemp_align _gsSqueakTemp_menuList _gsSqueakTemp_startIndex |
	_gsSqueakTemp_startIndex := self startIndex.
	_gsSqueakTemp_aList := #(#normal #bold #italic #narrow #underlined #struckOut #leftFlush #centered #rightFlush #justified ).
	_gsSqueakTemp_align := paragraph text
				alignmentAt: _gsSqueakTemp_startIndex
				ifAbsent: [paragraph textStyle alignment].
	_gsSqueakTemp_code := paragraph text emphasisAt: _gsSqueakTemp_startIndex.
	_gsSqueakTemp_menuList := WriteStream on: Array new.
	_gsSqueakTemp_menuList nextPut: (_gsSqueakTemp_code isZero
			ifTrue: ['<on>']
			ifFalse: ['<off>'])
			, 'normal' translated.
	_gsSqueakTemp_menuList
		nextPutAll: (#(#bold #italic #underlined #struckOut )
				collect: [:emph | (_gsSqueakTemp_code anyMask: (TextEmphasis perform: emph) emphasisCode)
						ifTrue: ['<on>' , emph asString translated]
						ifFalse: ['<off>' , emph asString translated]]).
	((paragraph text attributesAt: _gsSqueakTemp_startIndex)
			anySatisfy: [:attr | attr isKern
					and: [attr kern < 0]])
		ifTrue: [_gsSqueakTemp_menuList nextPut: '<on>' , 'narrow' translated]
		ifFalse: [_gsSqueakTemp_menuList nextPut: '<off>' , 'narrow' translated].
	_gsSqueakTemp_menuList
		nextPutAll: (#(#leftFlush #centered #rightFlush #justified )
				collectWithIndex: [:type :i | _gsSqueakTemp_align = (i - 1)
						ifTrue: ['<on>' , type asString translated]
						ifFalse: ['<off>' , type asString translated]]).
	_gsSqueakTemp_aList := #(#normal #bold #italic #underlined #struckOut #narrow #leftFlush #centered #rightFlush #justified ).
	_gsSqueakTemp_reply := UIManager default
				chooseFrom: _gsSqueakTemp_menuList contents
				values: _gsSqueakTemp_aList
				lines: #(1 6 ).
	_gsSqueakTemp_reply notNil
		ifTrue: [(#(#leftFlush #centered #rightFlush #justified ) includes: _gsSqueakTemp_reply)
				ifTrue: [self setAlignment: _gsSqueakTemp_reply.
					paragraph composeAll.
					self recomputeSelection]
				ifFalse: [self setEmphasis: _gsSqueakTemp_reply.
					paragraph composeAll.
					self recomputeSelection]].
	^ true