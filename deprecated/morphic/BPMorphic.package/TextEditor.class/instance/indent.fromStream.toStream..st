private
indent: delta fromStream: inStream toStream: outStream 
	"Append the contents of inStream to outStream, adding or deleting
	delta or -delta
	tabs at the beginning, and after every CR except a final CR. Do not
	add tabs
	to totally empty lines, and be sure nothing but tabs are removed from
	lines. "
	| _gsSqueakTemp_ch _gsSqueakTemp_skip _gsSqueakTemp_cr _gsSqueakTemp_tab _gsSqueakTemp_prev _gsSqueakTemp_atEnd |
	_gsSqueakTemp_cr := Character cr.
	_gsSqueakTemp_tab := Character tab.
	delta > 0
		ifTrue: ["shift right"
			_gsSqueakTemp_prev := _gsSqueakTemp_cr.
			[_gsSqueakTemp_ch := (_gsSqueakTemp_atEnd := inStream atEnd)
						ifTrue: [_gsSqueakTemp_cr]
						ifFalse: [inStream next].
			(_gsSqueakTemp_prev == _gsSqueakTemp_cr
					and: [_gsSqueakTemp_ch ~~ _gsSqueakTemp_cr])
				ifTrue: [delta
						timesRepeat: [outStream nextPut: _gsSqueakTemp_tab]].
			_gsSqueakTemp_atEnd]
				whileFalse: [outStream nextPut: _gsSqueakTemp_ch.
					_gsSqueakTemp_prev := _gsSqueakTemp_ch]]
		ifFalse: ["shift left"
			_gsSqueakTemp_skip := delta.
			"a negative number"
			[inStream atEnd]
				whileFalse: [((_gsSqueakTemp_ch := inStream next) == _gsSqueakTemp_tab
							and: [_gsSqueakTemp_skip < 0])
						ifFalse: [outStream nextPut: _gsSqueakTemp_ch].
					_gsSqueakTemp_skip := _gsSqueakTemp_ch == _gsSqueakTemp_cr
								ifTrue: [delta]
								ifFalse: [_gsSqueakTemp_skip + 1]]]