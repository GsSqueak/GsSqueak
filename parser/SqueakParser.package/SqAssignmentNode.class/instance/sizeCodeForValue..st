code generation
sizeCodeForValue: encoder 
	^ (variable sizeCodeForLoad: encoder forValue: true)
		+ (value sizeCodeForValue: encoder)
		+ (variable sizeCodeForStore: encoder)