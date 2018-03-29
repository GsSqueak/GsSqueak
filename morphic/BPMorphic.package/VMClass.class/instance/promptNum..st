simulation support
promptNum: string 
	| _gsSqueakTemp_s |
	_gsSqueakTemp_s := UIManager default request: string , ' (dec)'.
	_gsSqueakTemp_s := _gsSqueakTemp_s withBlanksTrimmed.
	^ _gsSqueakTemp_s notEmpty
		ifTrue: [Number readFrom: _gsSqueakTemp_s readStream]