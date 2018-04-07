parsing topaz output
convertToMethodList: topazOutput environment: environmentProxy

	^ topazOutput lines groupsOf: 4 atATimeCollect: [:group |
		self convertToMethodProxy: group inEnvironment: environmentProxy]