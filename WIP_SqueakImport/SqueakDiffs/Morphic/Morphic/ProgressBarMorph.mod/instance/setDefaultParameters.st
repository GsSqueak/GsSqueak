initialization
setDefaultParameters

	self
		borderColor: ((UserInterfaceTheme current get: #borderColor for: SystemProgressBarMorph) ifNil: [Color black]);
		borderWidth: ((UserInterfaceTheme current get: #borderWidth for: SystemProgressBarMorph) ifNil: [2]);
		color: ((UserInterfaceTheme current get: #color for: SystemProgressBarMorph) ifNil: [Color white]);
		progressColor: ((UserInterfaceTheme current get: #barColor for: SystemProgressBarMorph) ifNil: [Color green]).