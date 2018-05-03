simulation support
promptHex: string 
	| _gsSqueakTemp_s |
	_gsSqueakTemp_s := UIManager default request: string , ' (hex)'.
	_gsSqueakTemp_s := _gsSqueakTemp_s withBlanksTrimmed.
	^ (_gsSqueakTemp_s notEmpty
			and: ['-+0123456789abcdefABCDEF' includes: _gsSqueakTemp_s first])
		ifTrue: [(_gsSqueakTemp_s includes: $r)
				ifTrue: [Number readFrom: _gsSqueakTemp_s readStream]
				ifFalse: [(#('0x' '-0x')
						detect: [:prefix | _gsSqueakTemp_s beginsWith: prefix]
						ifNone: [])
						ifNotNil: [:prefix | 
							_gsSqueakTemp_s := _gsSqueakTemp_s allButFirst: prefix size.
							prefix first = $-
								ifTrue: [_gsSqueakTemp_s := '-' , _gsSqueakTemp_s]].
					Integer readFrom: _gsSqueakTemp_s readStream base: 16]]