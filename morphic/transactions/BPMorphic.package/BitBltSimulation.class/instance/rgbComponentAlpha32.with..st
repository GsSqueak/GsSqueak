combination rules
rgbComponentAlpha32: sourceWord with: destinationWord 
	"
	componentAlphaModeColor is the color,
	sourceWord contains an alpha value for each component of RGB
	each of which is encoded as0 meaning 0.0 and 255 meaning 1.0 .
	the rule is...
	
	color = componentAlphaModeColor.
	colorAlpha = componentAlphaModeAlpha.
	mask = sourceWord.
	dst.A = colorAlpha + (1 - colorAlpha) * dst.A
	dst.R = color.R * mask.R * colorAlpha + (1 - (mask.R * colorAlpha)) *
	dst.R dst.G = color.G * mask.G * colorAlpha + (1 - (mask.G*
	colorAlpha)) * dst.G
	dst.B = color.B * mask.B * colorAlpha + (1 - (mask.B* colorAlpha)) *
	dst.B "
	"Do NOT inline this into optimized loops"
	| _gsSqueakTemp_alpha _gsSqueakTemp_dstMask _gsSqueakTemp_srcColor _gsSqueakTemp_srcAlpha _gsSqueakTemp_b _gsSqueakTemp_g _gsSqueakTemp_r _gsSqueakTemp_a _gsSqueakTemp_aB _gsSqueakTemp_aG _gsSqueakTemp_aR _gsSqueakTemp_aA _gsSqueakTemp_answer _gsSqueakTemp_s _gsSqueakTemp_d |
	<inline: false>
	_gsSqueakTemp_alpha := sourceWord.
	_gsSqueakTemp_alpha = 0
		ifTrue: [^ destinationWord].
	_gsSqueakTemp_srcColor := componentAlphaModeColor.
	_gsSqueakTemp_srcAlpha := componentAlphaModeAlpha bitAnd: 255.
	_gsSqueakTemp_aB := _gsSqueakTemp_alpha bitAnd: 255.
	_gsSqueakTemp_alpha := _gsSqueakTemp_alpha >> 8.
	_gsSqueakTemp_aG := _gsSqueakTemp_alpha bitAnd: 255.
	_gsSqueakTemp_alpha := _gsSqueakTemp_alpha >> 8.
	_gsSqueakTemp_aR := _gsSqueakTemp_alpha bitAnd: 255.
	_gsSqueakTemp_alpha := _gsSqueakTemp_alpha >> 8.
	_gsSqueakTemp_aA := _gsSqueakTemp_alpha bitAnd: 255.
	_gsSqueakTemp_srcAlpha = 255
		ifFalse: [_gsSqueakTemp_aA := _gsSqueakTemp_aA * _gsSqueakTemp_srcAlpha >> 8.
			_gsSqueakTemp_aR := _gsSqueakTemp_aR * _gsSqueakTemp_srcAlpha >> 8.
			_gsSqueakTemp_aG := _gsSqueakTemp_aG * _gsSqueakTemp_srcAlpha >> 8.
			_gsSqueakTemp_aB := _gsSqueakTemp_aB * _gsSqueakTemp_srcAlpha >> 8].
	_gsSqueakTemp_dstMask := destinationWord.
	_gsSqueakTemp_d := _gsSqueakTemp_dstMask bitAnd: 255.
	_gsSqueakTemp_s := _gsSqueakTemp_srcColor bitAnd: 255.
	ungammaLookupTable == nil
		ifFalse: [_gsSqueakTemp_d := ungammaLookupTable at: _gsSqueakTemp_d.
			_gsSqueakTemp_s := ungammaLookupTable at: _gsSqueakTemp_s].
	_gsSqueakTemp_b := _gsSqueakTemp_d * (255 - _gsSqueakTemp_aB) >> 8 + (_gsSqueakTemp_s * _gsSqueakTemp_aB >> 8).
	_gsSqueakTemp_b > 255
		ifTrue: [_gsSqueakTemp_b := 255].
	gammaLookupTable == nil
		ifFalse: [_gsSqueakTemp_b := gammaLookupTable at: _gsSqueakTemp_b].
	_gsSqueakTemp_dstMask := _gsSqueakTemp_dstMask >> 8.
	_gsSqueakTemp_srcColor := _gsSqueakTemp_srcColor >> 8.
	_gsSqueakTemp_d := _gsSqueakTemp_dstMask bitAnd: 255.
	_gsSqueakTemp_s := _gsSqueakTemp_srcColor bitAnd: 255.
	ungammaLookupTable == nil
		ifFalse: [_gsSqueakTemp_d := ungammaLookupTable at: _gsSqueakTemp_d.
			_gsSqueakTemp_s := ungammaLookupTable at: _gsSqueakTemp_s].
	_gsSqueakTemp_g := _gsSqueakTemp_d * (255 - _gsSqueakTemp_aG) >> 8 + (_gsSqueakTemp_s * _gsSqueakTemp_aG >> 8).
	_gsSqueakTemp_g > 255
		ifTrue: [_gsSqueakTemp_g := 255].
	gammaLookupTable == nil
		ifFalse: [_gsSqueakTemp_g := gammaLookupTable at: _gsSqueakTemp_g].
	_gsSqueakTemp_dstMask := _gsSqueakTemp_dstMask >> 8.
	_gsSqueakTemp_srcColor := _gsSqueakTemp_srcColor >> 8.
	_gsSqueakTemp_d := _gsSqueakTemp_dstMask bitAnd: 255.
	_gsSqueakTemp_s := _gsSqueakTemp_srcColor bitAnd: 255.
	ungammaLookupTable == nil
		ifFalse: [_gsSqueakTemp_d := ungammaLookupTable at: _gsSqueakTemp_d.
			_gsSqueakTemp_s := ungammaLookupTable at: _gsSqueakTemp_s].
	_gsSqueakTemp_r := _gsSqueakTemp_d * (255 - _gsSqueakTemp_aR) >> 8 + (_gsSqueakTemp_s * _gsSqueakTemp_aR >> 8).
	_gsSqueakTemp_r > 255
		ifTrue: [_gsSqueakTemp_r := 255].
	gammaLookupTable == nil
		ifFalse: [_gsSqueakTemp_r := gammaLookupTable at: _gsSqueakTemp_r].
	_gsSqueakTemp_dstMask := _gsSqueakTemp_dstMask >> 8.
	_gsSqueakTemp_srcColor := _gsSqueakTemp_srcColor >> 8.
	_gsSqueakTemp_a := (_gsSqueakTemp_dstMask bitAnd: 255)
				* (255 - _gsSqueakTemp_aA) >> 8 + _gsSqueakTemp_aA.
	"no need to gamma correct alpha value ?"
	_gsSqueakTemp_a > 255
		ifTrue: [_gsSqueakTemp_a := 255].
	_gsSqueakTemp_answer := _gsSqueakTemp_a << 8 + _gsSqueakTemp_r << 8 + _gsSqueakTemp_g << 8 + _gsSqueakTemp_b.
	^ _gsSqueakTemp_answer