*Morphic-MorphicExtras-accessing
floatPrecision: aPrecision
	"Set the receiver's number of decimal places to correspond with the given precision.  The preferred protocol here is #decimalPlaces:, which conforms to the UI for this, but #floatPrecision: is retained for backward compatibility."

	self decimalPlaces: (Utilities decimalPlacesForFloatPrecision: aPrecision)