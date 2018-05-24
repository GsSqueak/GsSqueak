installing
installMethodsInto: class

	self instanceMethods do: [:method |
		class theNonMetaClass compileMethod: method source category: method category environmentId: 7.
		].
	self classMethods do: [:method |
		class theMetaClass compileMethod: method source category: method category environmentId: 7.
		]