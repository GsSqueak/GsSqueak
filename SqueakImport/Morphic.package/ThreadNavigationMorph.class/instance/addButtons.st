initialization
addButtons

	self addARow: {
		self inAColumn: {self buttonFirst}.
		self inAColumn: {self buttonPrevious}.
		self inAColumn: {self buttonForward}.
		self inAColumn: {self buttonLast}.
		self inAColumn: {self buttonExit}.
	}.
