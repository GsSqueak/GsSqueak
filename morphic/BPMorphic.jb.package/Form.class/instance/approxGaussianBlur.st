processing
approxGaussianBlur
	^ self
		processUsingKernel: (Matrix
				rows: 3
				columns: 3
				contents: #(1 2 1 2 4 2 1 2 1 ) * 0.0625)