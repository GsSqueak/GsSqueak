transforming
removeExclamationMark
	self squeakCode: (self squeakCode first: (self squeakCode lastIndexOf: ('!' asCharacter)) - 1)
