undo
undoAndReselect

	self
		replace: self history current intervalBetween
		with: self history current contentsBefore
		and: [self selectInterval: self history current intervalBefore].