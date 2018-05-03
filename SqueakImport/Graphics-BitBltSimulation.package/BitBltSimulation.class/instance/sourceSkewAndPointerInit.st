setup
sourceSkewAndPointerInit
	"This is only used when source and dest are same depth,
	ie, when the barrel-shift copy loop is used."
	| _gsSqueakTemp_dWid _gsSqueakTemp_sxLowBits _gsSqueakTemp_dxLowBits _gsSqueakTemp_pixPerM1 |
	<inline: true>
	_gsSqueakTemp_pixPerM1 := destPPW - 1.
	"A mask, assuming power of two"
	_gsSqueakTemp_sxLowBits := sx bitAnd: _gsSqueakTemp_pixPerM1.
	_gsSqueakTemp_dxLowBits := dx bitAnd: _gsSqueakTemp_pixPerM1.
	"check if need to preload buffer
	(i.e., two words of source needed for first word of destination)"
	hDir > 0
		ifTrue: ["n Bits stored in 1st word of dest"
			_gsSqueakTemp_dWid := bbW min: destPPW - _gsSqueakTemp_dxLowBits.
			preload := _gsSqueakTemp_sxLowBits + _gsSqueakTemp_dWid > _gsSqueakTemp_pixPerM1]
		ifFalse: [_gsSqueakTemp_dWid := bbW min: _gsSqueakTemp_dxLowBits + 1.
			preload := _gsSqueakTemp_sxLowBits - _gsSqueakTemp_dWid + 1 < 0].
	"calculate right-shift skew from source to dest"
	sourceMSB
		ifTrue: [skew := _gsSqueakTemp_sxLowBits - _gsSqueakTemp_dxLowBits * destDepth]
		ifFalse: [skew := _gsSqueakTemp_dxLowBits - _gsSqueakTemp_sxLowBits * destDepth].
	"-32..32"
	preload
		ifTrue: [skew < 0
				ifTrue: [skew := skew + 32]
				ifFalse: [skew := skew - 32]].
	"Calc byte addr and delta from longWord info"
	sourceIndex := sourceBits + (sy * sourcePitch) + (sx // (32 // sourceDepth) * 4).
	"calculate increments from end of 1 line to start of next"
	sourceDelta := sourcePitch * vDir - (4 * (nWords * hDir)).
	preload
		ifTrue: ["Compensate for extra source word fetched"
			sourceDelta := sourceDelta - (4 * hDir)]