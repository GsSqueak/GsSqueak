model access
setValue: newValue 
	"Either changes the value directly or tries to go the loop through the
	model. See #update:."
	self setValueSelector
		ifNotNil: [:selector | 
			| trimmedValue |
			trimmedValue := self trimmedValue: newValue.
			"Only notify about changed values."
			trimmedValue ~= self value
				ifTrue: [model perform: selector with: trimmedValue]].
	(self setValueSelector isNil
			or: [self getValueSelector isNil])
		ifTrue: [self value: newValue]