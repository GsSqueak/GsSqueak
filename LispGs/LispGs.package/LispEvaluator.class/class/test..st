booleans
test: aBoolean 
	^ aBoolean
		ifTrue: [self trueValue]
		ifFalse: [self falseValue]