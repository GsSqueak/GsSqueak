layout
layoutChanged

	super layoutChanged.
	submorphs withIndexDo:
		[:m :i |
		m
			position: self position + (((i-1) * self width / digits) rounded @ 0);
			extent: (self width / digits) rounded @ self height]