building
derive: propertySymbol for: aClassOrSymbol from: anotherClassOrSymbol at: anotherPropertySymbol do: block
	
	self
		set: propertySymbol
		for: aClassOrSymbol
		to: (MessageSend
			receiver: self
			selector: #get:for:do:
			arguments: {anotherPropertySymbol. anotherClassOrSymbol. block}).