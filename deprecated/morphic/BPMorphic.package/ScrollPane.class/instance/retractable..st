accessing retractable
retractable: aBoolean 
	retractableScrollBar == aBoolean
		ifFalse: [self retractableOrNot
			"toggles it"]