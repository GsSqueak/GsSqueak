typing support
insertTypeAhead
	self typeAhead position = 0
		ifFalse: [self
				zapSelectionWith: (Text string: self typeAhead contents emphasis: emphasisHere).
			self typeAhead reset.
			self unselect]