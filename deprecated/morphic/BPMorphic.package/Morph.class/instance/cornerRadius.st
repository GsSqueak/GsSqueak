rounding
cornerRadius
	^ self
		valueOfProperty: #cornerRadius
		ifAbsent: [self class preferredCornerRadius]