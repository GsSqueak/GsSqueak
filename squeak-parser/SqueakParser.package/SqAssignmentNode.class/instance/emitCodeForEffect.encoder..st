code generation
emitCodeForEffect: stack encoder: encoder 
	variable
		emitCodeForLoad: stack
		forValue: false
		encoder: encoder.
	value emitCodeForValue: stack encoder: encoder.
	pc := encoder methodStreamPosition + 1.
	variable emitCodeForStorePop: stack encoder: encoder