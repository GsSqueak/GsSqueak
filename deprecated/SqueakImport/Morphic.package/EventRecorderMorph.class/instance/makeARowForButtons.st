initialization
makeARowForButtons

	^AlignmentMorph newRow
		vResizing: #shrinkWrap;
		wrapCentering: #center;
		cellPositioning: #leftCenter;
		minCellSize: 4;
		color: Color blue