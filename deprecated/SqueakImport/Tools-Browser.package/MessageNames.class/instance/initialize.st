initialization
initialize

	super initialize.
	
	searchString := ValueHolder new contents: ''.
	searchString addDependent: self.
	
	selectorList := #().
	selectorListIndex := 0.
	
	self messageListIndex: 0.