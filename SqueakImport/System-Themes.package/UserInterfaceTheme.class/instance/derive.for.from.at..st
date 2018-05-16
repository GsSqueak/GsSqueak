building
derive: propertySymbol for: aClassOrSymbol from: anotherClassOrSymbol at: anotherPropertySymbol
	"Derive this property from another property."
	
	self
		set: propertySymbol
		for: aClassOrSymbol
		to: (MessageSend
			receiver: self
			selector: #get:for:
			arguments: {anotherPropertySymbol. anotherClassOrSymbol}).