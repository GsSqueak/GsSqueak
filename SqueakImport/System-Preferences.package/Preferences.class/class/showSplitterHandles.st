standard queries
showSplitterHandles
	^ self
		valueOfFlag: #showSplitterHandles
		ifAbsent: [false]