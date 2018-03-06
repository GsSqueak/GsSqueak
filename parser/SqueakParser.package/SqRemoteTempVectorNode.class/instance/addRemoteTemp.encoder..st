closure analysis
addRemoteTemp: aTempVariableNode encoder: encoder 
	remoteTemps
		ifNil: [remoteTemps := OrderedCollection new].
	remoteTemps addLast: aTempVariableNode.
	aTempVariableNode
		referenceScopesAndIndicesDo: [:scopeBlock :location | "<BlockNode>"
			"<Integer>"
			self addReadWithin: scopeBlock at: location]