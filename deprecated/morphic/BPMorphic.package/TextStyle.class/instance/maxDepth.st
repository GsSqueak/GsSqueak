accessing
maxDepth
	^ (self fonts
		collect: [:font | font depth]) max