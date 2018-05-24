standard queries
enableVirtualOLPCDisplay
	^ self
		valueOfFlag: #enableVirtualOLPCDisplay
		ifAbsent: [false]