support
setValueFraction: newValueFraction 
	self setValue: newValueFraction * (self maximumValue - self minimumValue) + self minimumValue