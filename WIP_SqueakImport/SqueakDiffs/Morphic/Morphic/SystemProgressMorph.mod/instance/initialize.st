initialization
initialize
	super initialize.
	activeSlots := 0.
	bars := Array new: 10.
	labels := Array new: 10.
	lock := Semaphore forMutualExclusion.
	self setDefaultParameters;
		setProperty: #morphicLayerNumber toValue: self morphicLayerNumber;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		cellPositioning: #leftCenter;
		cellInset: 5;
		listCentering: #center;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		layoutInset: Inset;
		minWidth: 150