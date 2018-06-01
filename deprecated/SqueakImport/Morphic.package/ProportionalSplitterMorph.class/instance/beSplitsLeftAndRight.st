direction
beSplitsLeftAndRight

	splitsTopAndBottom := false.
	self
		hResizing: #rigid;
		vResizing: #spaceFill.
	self width: self class gripThickness.