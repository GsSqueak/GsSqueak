code generation
emitCodeForValue: stack encoder: encoder 
	variable
		emitCodeForLoad: stack
		forValue: true
		encoder: encoder.
	value emitCodeForValue: stack encoder: encoder.
	pc := encoder methodStreamPosition + 1.
	variable emitCodeForStore: stack encoder: encoder