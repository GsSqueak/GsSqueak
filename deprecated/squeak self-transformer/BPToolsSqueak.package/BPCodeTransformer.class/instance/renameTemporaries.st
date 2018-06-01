transforming
renameTemporaries
	ast temporaries do: [ :each |
		self renameTemporary: each ]