pixel mapping
rgbMap: sourcePixel from: nBitsIn to: nBitsOut 
	"Convert the given pixel value with nBitsIn bits for each color
	component to a pixel value with nBitsOut bits for each color
	component. Typical values for nBitsIn/nBitsOut are 3, 5, or 8."
	| _gsSqueakTemp_mask _gsSqueakTemp_d _gsSqueakTemp_srcPix _gsSqueakTemp_destPix |
	<inline: true>
	(_gsSqueakTemp_d := nBitsOut - nBitsIn) > 0
		ifTrue: ["Expand to more bits by zero-fill"
			_gsSqueakTemp_mask := 1 << nBitsIn - 1.
			"Transfer mask"
			_gsSqueakTemp_srcPix := sourcePixel << _gsSqueakTemp_d.
			_gsSqueakTemp_mask := _gsSqueakTemp_mask << _gsSqueakTemp_d.
			_gsSqueakTemp_destPix := _gsSqueakTemp_srcPix bitAnd: _gsSqueakTemp_mask.
			_gsSqueakTemp_mask := _gsSqueakTemp_mask << nBitsOut.
			_gsSqueakTemp_srcPix := _gsSqueakTemp_srcPix << _gsSqueakTemp_d.
			^ _gsSqueakTemp_destPix
				+ (_gsSqueakTemp_srcPix bitAnd: _gsSqueakTemp_mask)
				+ (_gsSqueakTemp_srcPix << _gsSqueakTemp_d bitAnd: _gsSqueakTemp_mask << nBitsOut)]
		ifFalse: ["Compress to fewer bits by truncation"
			_gsSqueakTemp_d = 0
				ifTrue: [nBitsIn = 5
						ifTrue: ["Sometimes called with 16 bits, though pixel is
							15, but we must never return more than 15."
							^ sourcePixel bitAnd: 32767].
					nBitsIn = 8
						ifTrue: ["Sometimes called with 32 bits, though pixel is
							24, but we must never return more than 24."
							^ sourcePixel bitAnd: 16777215].
					^ sourcePixel].
			"no compression"
			sourcePixel = 0
				ifTrue: [^ sourcePixel].
			"always map 0 (transparent) to 0"
			_gsSqueakTemp_d := nBitsIn - nBitsOut.
			_gsSqueakTemp_mask := 1 << nBitsOut - 1.
			"Transfer mask"
			_gsSqueakTemp_srcPix := sourcePixel >> _gsSqueakTemp_d.
			_gsSqueakTemp_destPix := _gsSqueakTemp_srcPix bitAnd: _gsSqueakTemp_mask.
			_gsSqueakTemp_mask := _gsSqueakTemp_mask << nBitsOut.
			_gsSqueakTemp_srcPix := _gsSqueakTemp_srcPix >> _gsSqueakTemp_d.
			_gsSqueakTemp_destPix := _gsSqueakTemp_destPix
						+ (_gsSqueakTemp_srcPix bitAnd: _gsSqueakTemp_mask)
						+ (_gsSqueakTemp_srcPix >> _gsSqueakTemp_d bitAnd: _gsSqueakTemp_mask << nBitsOut).
			_gsSqueakTemp_destPix = 0
				ifTrue: [^ 1].
			"Dont fall into transparent by truncation"
			^ _gsSqueakTemp_destPix]