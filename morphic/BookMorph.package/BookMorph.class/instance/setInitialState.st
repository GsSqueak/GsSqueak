initialization
setInitialState
	self listDirection: #topToBottom;
		 wrapCentering: #topLeft;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 layoutInset: 5.
	pageSize := 160 @ 300.
	self enableDragNDrop