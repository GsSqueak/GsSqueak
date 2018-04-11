private
computePixelRampOfSize: length 
	"Compute the pixel ramp in the receiver"
	| _gsSqueakTemp_bits _gsSqueakTemp_lastValue _gsSqueakTemp_ramp _gsSqueakTemp_lastColor _gsSqueakTemp_lastIndex _gsSqueakTemp_lastWord |
	_gsSqueakTemp_ramp := colorRamp
				asSortedCollection: [:a1 :a2 | a1 key < a2 key].
	_gsSqueakTemp_bits := Bitmap new: length.
	_gsSqueakTemp_lastColor := _gsSqueakTemp_ramp first value.
	_gsSqueakTemp_lastWord := _gsSqueakTemp_lastColor pixelWordForDepth: 32.
	_gsSqueakTemp_lastIndex := 0.
	_gsSqueakTemp_ramp
		do: [:assoc | 
			| nextIndex nextColor distance theta step nextWord |
			nextIndex := (assoc key * length) rounded.
			nextColor := assoc value.
			nextWord := nextColor pixelWordForDepth: 32.
			distance := nextIndex - _gsSqueakTemp_lastIndex.
			distance = 0
				ifTrue: [distance := 1].
			step := 1.0 / distance asFloat.
			theta := 0.0.
			_gsSqueakTemp_lastIndex + 1
				to: nextIndex
				do: [:i | 
					theta := theta + step.
					"The following is an open-coded version of:
					color := nextColor alphaMixed: theta with: lastColor.
					bits at: i put: (color scaledPixelValue32).
					"
					_gsSqueakTemp_bits
						at: i
						put: (self
								scaledAlphaMix: theta
								of: _gsSqueakTemp_lastWord
								with: nextWord)].
			_gsSqueakTemp_lastIndex := nextIndex.
			_gsSqueakTemp_lastColor := nextColor.
			_gsSqueakTemp_lastWord := nextWord].
	_gsSqueakTemp_lastValue := _gsSqueakTemp_lastColor scaledPixelValue32.
	_gsSqueakTemp_lastIndex + 1
		to: length
		do: [:i | _gsSqueakTemp_bits at: i put: _gsSqueakTemp_lastValue].
	^ _gsSqueakTemp_bits