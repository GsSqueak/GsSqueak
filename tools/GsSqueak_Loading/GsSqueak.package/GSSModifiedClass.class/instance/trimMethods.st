utility
trimMethods

	instanceMethods ifNotNil: [:methods |
		instanceMethods := methods reject: [:method |
			| originalSource |
			originalSource := self realClass theNonMetaClass
									sourceCodeAt: method selector
									ifAbsent: [nil].
			originalSource
				ifNil: [true]
				ifNotNil: [method source = originalSource asString]]].

	classMethods ifNotNil: [:methods |
		classMethods := methods reject: [:method |
			| originalSource |
			originalSource := self realClass theMetaClass 
									sourceCodeAt: method selector
									ifAbsent: [nil].
			originalSource
				ifNil: [true]
				ifNotNil: [method source = originalSource asString]]].