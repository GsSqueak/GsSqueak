code pane
aboutToStyle: aStyler 
	self shouldStyle
		ifFalse: [^ false].
	aStyler classOrMetaClass: nil;
		 workspace: self.
	^ true