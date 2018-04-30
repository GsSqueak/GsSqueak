processing
emboss

	^ self processUsingKernel: (Matrix rows: 3 columns: 3 contents: #(
		-2 -1  0
		-1  1  1
		 0  1  2
	))