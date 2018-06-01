model access
getMaximumValue
	
	self getMaximumValueSelector ifNotNil: [:selector |
		self maximumValue: (model perform: selector)].
	^ self maximumValue