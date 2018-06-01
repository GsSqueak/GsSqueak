standard queries
enablePortraitMode
	^ self
		valueOfFlag: #enablePortraitMode
		ifAbsent: [false]