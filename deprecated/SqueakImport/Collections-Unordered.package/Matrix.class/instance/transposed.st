accessing rows/columns
transposed
	self assert: [nrows = ncols].
	^self indicesCollect: [:row :column | self at: column at: row]