handles
addDebugHandle: handleSpec
	Preferences debugHaloHandle ifTrue:
		[self addHandle: handleSpec
			on: #mouseDown send: #doDebug:with: to: self]
