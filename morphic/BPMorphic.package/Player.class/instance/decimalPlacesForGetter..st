misc
decimalPlacesForGetter: aGetter 
	"Answer the number of decimal places wanted when displaying the
	getter's value. Answer nil if this object does not have a personal
	preference regarding this getter."
	^ costume decimalPlacesForGetter: aGetter