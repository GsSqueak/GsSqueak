printing
printFractionAsDecimalOn: stream 
	"Please note: this is different from printOn:showingDecimalPlaces: because it prints truncated."

	fraction printTruncatedOn: stream showingDecimalPlaces: scale