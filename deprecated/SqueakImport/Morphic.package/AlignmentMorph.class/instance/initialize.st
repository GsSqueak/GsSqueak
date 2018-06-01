initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self layoutPolicy: TableLayout new;
	 listDirection: #leftToRight;
	 wrapCentering: #topLeft;
	 hResizing: #spaceFill;
	 vResizing: #spaceFill;
	 layoutInset: 2;
	 rubberBandCells: true