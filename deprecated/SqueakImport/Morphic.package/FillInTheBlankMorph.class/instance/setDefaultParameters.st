initialization
setDefaultParameters

	super setDefaultParameters.
	textPane ifNotNil: [:tp | tp borderColor: self borderColor].