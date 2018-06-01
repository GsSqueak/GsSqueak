printing
printFractionAsDecimalOn: stream 
	"Please note: this is different from printOn:showingDecimalPlaces: because it prints truncated."

	mantissa printTruncatedOn: stream showingDecimalPlaces: scale
