system startup
startUp
	(Smalltalk platformName =  'Mac OS') ifTrue: [
		self useHTTPProxy ifTrue: [
			 (self getHTTPProxyHost findTokens: ':') ifNotEmpty: [:p |
			 	HTTPSocket useProxyServerNamed: p first port: p second asInteger]]]