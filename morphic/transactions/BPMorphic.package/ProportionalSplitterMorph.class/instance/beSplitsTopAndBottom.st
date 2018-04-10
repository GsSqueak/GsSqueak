direction
beSplitsTopAndBottom
	splitsTopAndBottom := true.
	self vResizing: #rigid;
		 hResizing: #spaceFill.
	self height: self class gripThickness