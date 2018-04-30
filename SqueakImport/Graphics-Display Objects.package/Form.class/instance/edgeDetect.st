processing
edgeDetect

	^ self processUsingKernel: (Matrix rows: 3 columns: 3 contents: #(
		-1 -1 -1
		-1  8 -1
		-1 -1 -1
	))