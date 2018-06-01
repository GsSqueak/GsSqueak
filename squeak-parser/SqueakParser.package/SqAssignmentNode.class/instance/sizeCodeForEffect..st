code generation
sizeCodeForEffect: encoder 
	^ (variable sizeCodeForLoad: encoder forValue: false)
		+ (value sizeCodeForValue: encoder)
		+ (variable sizeCodeForStorePop: encoder)