initialization
createButtonRow
	^ buttonRow := Morph new color: Color transparent;
				 changeTableLayout;
				 vResizing: #shrinkWrap;
				 hResizing: #spaceFill;
				 listDirection: #leftToRight;
				 listCentering: #center;
				 cellInset: 5;
				 yourself