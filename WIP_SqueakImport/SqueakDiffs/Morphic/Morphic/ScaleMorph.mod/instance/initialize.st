initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	
	start := 0.
	stop := 100.
	minorTick := 1.
	majorTick := 10.
	minorTickLength := 3.
	majorTickLength := 10.
	caption := nil.
	tickPrintBlock := [:v | v printString].
	labelsAbove := true.
	captionAbove := true