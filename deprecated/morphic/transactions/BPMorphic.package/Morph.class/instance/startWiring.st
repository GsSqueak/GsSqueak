menu
startWiring
	Smalltalk
		at: #NCAAConnectorMorph
		ifPresent: [:connectorClass | connectorClass newCurvyArrow startWiringFrom: self]