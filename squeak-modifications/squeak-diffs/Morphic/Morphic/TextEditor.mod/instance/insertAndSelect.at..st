new selection
insertAndSelect: aString at: anInteger

	self closeTypeIn.
	
	self selectInvisiblyFrom: anInteger to: anInteger - 1.
	self openTypeIn.

	self
		replace: self selectionInterval
		with: (Text string: (' ', aString) attributes: emphasisHere)
		and: [].

	self closeTypeIn.