utilities
pixelsPerInch: aNumber
	"Set the nominal number of pixels per inch to aNumber."
	TextConstants at: #pixelsPerInch put: aNumber asFloat.
	AbstractFont allSubInstancesDo: [ :font | font pixelsPerInchChanged ].