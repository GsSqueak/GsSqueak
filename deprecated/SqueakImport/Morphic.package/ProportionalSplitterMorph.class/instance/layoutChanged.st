layout
layoutChanged	
	
	super layoutChanged.
	handle ifNotNil: [handle position: self bounds center - (2@2)]