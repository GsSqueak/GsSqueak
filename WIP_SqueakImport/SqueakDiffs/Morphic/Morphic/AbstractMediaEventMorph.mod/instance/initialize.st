initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self layoutPolicy: TableLayout new;
	  listDirection: #leftToRight;
	  wrapCentering: #topLeft;
	  hResizing: #shrinkWrap;
	  vResizing: #shrinkWrap;
	  layoutInset: 2;
	  rubberBandCells: true