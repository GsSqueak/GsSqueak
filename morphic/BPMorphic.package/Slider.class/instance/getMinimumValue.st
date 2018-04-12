model access
getMinimumValue
	self getMinimumValueSelector
		ifNotNil: [:selector | self
				minimumValue: (model perform: selector)].
	^ self minimumValue