shapes-compressed
loadCompressedShape: points segments: nSegments leftFills: leftFills rightFills: rightFills lineWidths: lineWidths lineFills: lineFills fillIndexList: fillIndexList pointShort: pointsShort 
	"Load a compressed shape into the engine.
	WARNING: THIS METHOD NEEDS THE FULL FRAME SIZE!!!!
	"
	| _gsSqueakTemp_leftRun _gsSqueakTemp_rightRun _gsSqueakTemp_widthRun _gsSqueakTemp_lineFillRun _gsSqueakTemp_leftLength _gsSqueakTemp_rightLength _gsSqueakTemp_widthLength _gsSqueakTemp_lineFillLength _gsSqueakTemp_leftValue _gsSqueakTemp_rightValue _gsSqueakTemp_widthValue _gsSqueakTemp_lineFillValue |
	nSegments = 0
		ifTrue: [^ 0].
	"Initialize run length encodings"
	_gsSqueakTemp_leftRun := _gsSqueakTemp_rightRun := _gsSqueakTemp_widthRun := _gsSqueakTemp_lineFillRun := -1.
	_gsSqueakTemp_leftLength := _gsSqueakTemp_rightLength := _gsSqueakTemp_widthLength := _gsSqueakTemp_lineFillLength := 1.
	_gsSqueakTemp_leftValue := _gsSqueakTemp_rightValue := _gsSqueakTemp_widthValue := _gsSqueakTemp_lineFillValue := 0.
	1
		to: nSegments
		do: [:i | 
			"Decrement current run length and load new stuff"
			(_gsSqueakTemp_leftLength := _gsSqueakTemp_leftLength - 1) <= 0
				ifTrue: [_gsSqueakTemp_leftRun := _gsSqueakTemp_leftRun + 1.
					_gsSqueakTemp_leftLength := self shortRunLengthAt: _gsSqueakTemp_leftRun from: leftFills.
					_gsSqueakTemp_leftValue := self shortRunValueAt: _gsSqueakTemp_leftRun from: leftFills.
					_gsSqueakTemp_leftValue = 0
						ifFalse: [_gsSqueakTemp_leftValue := fillIndexList at: _gsSqueakTemp_leftValue - 1.
							_gsSqueakTemp_leftValue := self transformColor: _gsSqueakTemp_leftValue.
							engineStopped
								ifTrue: [^ nil]]].
			(_gsSqueakTemp_rightLength := _gsSqueakTemp_rightLength - 1) <= 0
				ifTrue: [_gsSqueakTemp_rightRun := _gsSqueakTemp_rightRun + 1.
					_gsSqueakTemp_rightLength := self shortRunLengthAt: _gsSqueakTemp_rightRun from: rightFills.
					_gsSqueakTemp_rightValue := self shortRunValueAt: _gsSqueakTemp_rightRun from: rightFills.
					_gsSqueakTemp_rightValue = 0
						ifFalse: [_gsSqueakTemp_rightValue := fillIndexList at: _gsSqueakTemp_rightValue - 1.
							_gsSqueakTemp_rightValue := self transformColor: _gsSqueakTemp_rightValue]].
			(_gsSqueakTemp_widthLength := _gsSqueakTemp_widthLength - 1) <= 0
				ifTrue: [_gsSqueakTemp_widthRun := _gsSqueakTemp_widthRun + 1.
					_gsSqueakTemp_widthLength := self shortRunLengthAt: _gsSqueakTemp_widthRun from: lineWidths.
					_gsSqueakTemp_widthValue := self shortRunValueAt: _gsSqueakTemp_widthRun from: lineWidths.
					_gsSqueakTemp_widthValue = 0
						ifFalse: [_gsSqueakTemp_widthValue := self transformWidth: _gsSqueakTemp_widthValue]].
			(_gsSqueakTemp_lineFillLength := _gsSqueakTemp_lineFillLength - 1) <= 0
				ifTrue: [_gsSqueakTemp_lineFillRun := _gsSqueakTemp_lineFillRun + 1.
					_gsSqueakTemp_lineFillLength := self shortRunLengthAt: _gsSqueakTemp_lineFillRun from: lineFills.
					_gsSqueakTemp_lineFillValue := self shortRunValueAt: _gsSqueakTemp_lineFillRun from: lineFills.
					_gsSqueakTemp_lineFillValue = 0
						ifFalse: [_gsSqueakTemp_lineFillValue := fillIndexList at: _gsSqueakTemp_lineFillValue - 1]].
			self
				loadCompressedSegment: i - 1
				from: points
				short: pointsShort
				leftFill: _gsSqueakTemp_leftValue
				rightFill: _gsSqueakTemp_rightValue
				lineWidth: _gsSqueakTemp_widthValue
				lineColor: _gsSqueakTemp_lineFillValue.
			engineStopped
				ifTrue: [^ nil]]