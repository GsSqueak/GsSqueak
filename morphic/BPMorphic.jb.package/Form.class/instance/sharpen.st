processing
sharpen	^ self		processUsingKernel: (Matrix				rows: 3				columns: 3				contents: #(0 -1 0 -1 5 -1 0 -1 0 ))