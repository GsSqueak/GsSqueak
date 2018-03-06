code generation
emitCodeForLoad: stack forValue: forValue encoder: encoder 
	rcvrNode emitCodeForValue: stack encoder: encoder.
	fieldDef accessKey
		ifNotNil: [super emitCodeForValue: stack encoder: encoder]