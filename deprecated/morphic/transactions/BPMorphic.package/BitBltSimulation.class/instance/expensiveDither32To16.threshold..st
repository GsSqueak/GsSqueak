pixel mapping
expensiveDither32To16: srcWord threshold: ditherValue 
	"Dither the given 32bit word to 16 bit. Ignore alpha."
	| _gsSqueakTemp_pv _gsSqueakTemp_threshold _gsSqueakTemp_value _gsSqueakTemp_out |
	<inline: true>
	"You bet"
	_gsSqueakTemp_pv := srcWord bitAnd: 255.
	_gsSqueakTemp_threshold := ditherThresholds16
				at: (_gsSqueakTemp_pv bitAnd: 7).
	_gsSqueakTemp_value := ditherValues16
				at: (_gsSqueakTemp_pv bitShift: -3).
	ditherValue < _gsSqueakTemp_threshold
		ifTrue: [_gsSqueakTemp_out := _gsSqueakTemp_value + 1]
		ifFalse: [_gsSqueakTemp_out := _gsSqueakTemp_value].
	_gsSqueakTemp_pv := (srcWord bitShift: -8)
				bitAnd: 255.
	_gsSqueakTemp_threshold := ditherThresholds16
				at: (_gsSqueakTemp_pv bitAnd: 7).
	_gsSqueakTemp_value := ditherValues16
				at: (_gsSqueakTemp_pv bitShift: -3).
	ditherValue < _gsSqueakTemp_threshold
		ifTrue: [_gsSqueakTemp_out := _gsSqueakTemp_out
						bitOr: (_gsSqueakTemp_value + 1 bitShift: 5)]
		ifFalse: [_gsSqueakTemp_out := _gsSqueakTemp_out
						bitOr: (_gsSqueakTemp_value bitShift: 5)].
	_gsSqueakTemp_pv := (srcWord bitShift: -16)
				bitAnd: 255.
	_gsSqueakTemp_threshold := ditherThresholds16
				at: (_gsSqueakTemp_pv bitAnd: 7).
	_gsSqueakTemp_value := ditherValues16
				at: (_gsSqueakTemp_pv bitShift: -3).
	ditherValue < _gsSqueakTemp_threshold
		ifTrue: [_gsSqueakTemp_out := _gsSqueakTemp_out
						bitOr: (_gsSqueakTemp_value + 1 bitShift: 10)]
		ifFalse: [_gsSqueakTemp_out := _gsSqueakTemp_out
						bitOr: (_gsSqueakTemp_value bitShift: 10)].
	^ _gsSqueakTemp_out