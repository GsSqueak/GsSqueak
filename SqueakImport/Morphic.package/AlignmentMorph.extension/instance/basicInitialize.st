*Morphic-MorphicExtras-initialization
basicInitialize
	"Do basic generic initialization of the instance variables"
	super basicInitialize.
	""
	self layoutPolicy: TableLayout new;
	  listDirection: #leftToRight;
	  wrapCentering: #topLeft;
	  hResizing: #spaceFill;
	  vResizing: #spaceFill;
	  layoutInset: 2;
	  rubberBandCells: true