-Etoys-scripting
defaultFloatPrecisionFor: aGetSelector 
	"Answer a number indicating the default float precision to be used in a
	numeric readout for which the receiver provides the data. Individual
	morphs can override this. Showing fractional values for readouts of
	getCursor was in response to an explicit request from ack"
	(self renderedMorph decimalPlacesForGetter: aGetSelector)
		ifNotNil: [:places | ^ Utilities floatPrecisionForDecimalPlaces: places].
	(#(#getCursor #getNumericValue #getNumberAtCursor #getCursorWrapped #getScaleFactor #getUnitVector #getAlpha ) includes: aGetSelector)
		ifTrue: [^ 0.01].
	^ 1