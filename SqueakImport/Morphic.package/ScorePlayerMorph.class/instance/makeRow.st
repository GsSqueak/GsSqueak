layout
makeRow

	^ AlignmentMorph newRow
		color: color;
		layoutInset: 0;
		wrapCentering: #center; cellPositioning: #leftCenter;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap
