key decode table
keyDecodeTable
	^ KeyDecodeTable
		ifNil: [self installKeyDecodeTable]