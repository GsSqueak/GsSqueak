initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	saved := true.
	self listDirection: #topToBottom;
		 wrapCentering: #center;
		 cellPositioning: #topCenter;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 layoutInset: 2;
		 minCellSize: 4;
		 addButtons