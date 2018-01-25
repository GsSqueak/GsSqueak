closure support
capturedTempNames

	^ self methodNode scope capturedVars collect: [:var | var name]