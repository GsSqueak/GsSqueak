initialization
initialize
	"Initialize the receiver to have default values in its instance variables."
	super initialize.
	""
	format := #default.
	"formats: #string, #default"
	target := getSelector := putSelector := nil.
	floatPrecision := 1.
	growable := true.
	stepTime := nil.
	autoAcceptOnFocusLoss := true.
	minimumWidth := 8.
	maximumWidth := 366