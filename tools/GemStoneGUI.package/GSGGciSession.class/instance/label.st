interface
label

	^ 'GCI: {1} - {2}'
		format: {
			self gciSession sessionDescription stoneNRS.
			self gciSession sessionDescription userID}