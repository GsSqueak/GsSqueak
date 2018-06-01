initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	somethingChanged := true.
	self dragEnabled: true;
		 layoutPolicy: TableLayout new;
		 listDirection: #topToBottom;
		 wrapCentering: #topLeft;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 layoutInset: 6;
		
		 rubberBandCells: true