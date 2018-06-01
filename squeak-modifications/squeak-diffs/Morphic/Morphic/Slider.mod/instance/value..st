accessing
value: newValue

	| t |
	t := self trimmedValue: newValue.
	t = value ifTrue: [^ self].
	
	value := t.
	self computeSlider.