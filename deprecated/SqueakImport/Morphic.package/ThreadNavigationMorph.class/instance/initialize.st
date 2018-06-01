initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self layoutInset: 6;
	  hResizing: #shrinkWrap;
	  vResizing: #shrinkWrap;
	  useRoundedCorners;
	  ensureSuitableDefaults;
	  addButtons