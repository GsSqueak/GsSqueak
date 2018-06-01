undo
redoAndReselect
	self
		replace: self history current intervalBefore
		with: self history current contentsAfter
		and: [self selectInterval: self history current intervalAfter]