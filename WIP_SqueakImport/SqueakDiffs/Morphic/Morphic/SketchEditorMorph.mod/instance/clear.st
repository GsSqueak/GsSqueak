actions & preps
clear
	"wipe out all the paint"

	self polyFreeze.		"end polygon mode"
	paintingForm fillWithColor: Color transparent.
	self invalidRect: bounds.