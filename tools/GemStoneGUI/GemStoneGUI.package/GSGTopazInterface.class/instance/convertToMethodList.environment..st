parsing topaz output
convertToMethodList: topazOutput environment: environmentProxy

	^ topazOutput lines groupsOf: 4 atATimeCollect: [:group | 
		GSGMethodProxy new
			inClass: (self classProxyNamed: group first asSymbol inEnvironment: environmentProxy);
			selector: group second asSymbol;
			envId: (self convertToInteger: group third);
			category: group fourth asSymbol]