miscellaneous
decimalPlacesForFloatPrecision: precision 
	"Answer the number of decimal places that correspond to the given
	floatPrecision "
	^ (#(1 0.1 0.01 0.001 0.0001 1.0e-5 1.0e-6 1.0e-7 1.0e-8 1.0e-9 )
		indexOf: precision
		ifAbsent: [^ precision log negated floor])
		- 1"
	#(1 0.1 0.01 0.001 0.0001 0.00001 0.000001 0.0000001
	0.00000001 0.000000001) collect: [:prec | Utilities
	decimalPlacesForFloatPrecision: prec
	"