client services
getMCBootstrapLoaderClass
	^Smalltalk at: #MCBootstrapLoader
		ifAbsent: 
			[(self memberNamed: 'MCBootstrapLoader.st') 
				ifNotNil: [:m | self fileInMemberNamed: m.
					Smalltalk at: #MCBootstrapLoader ifAbsent: []]]