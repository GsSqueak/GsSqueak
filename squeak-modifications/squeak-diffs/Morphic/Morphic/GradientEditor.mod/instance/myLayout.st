initialization
myLayout
	self color: (Color white darker) ;
		 cornerStyle: #rounded ;
		 borderWidth: 0;
		 layoutPolicy: TableLayout new;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 cellPositioning: #center;
		 listCentering: #topLeft;
		 layoutInset: 4;
		 listDirection: #topToBottom;
		 reverseTableCells: true;
		 wrapCentering: #topLeft;
		 cellInset: 4