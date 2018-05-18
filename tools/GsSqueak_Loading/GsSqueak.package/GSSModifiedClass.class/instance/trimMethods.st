utility
trimMethods

	instanceMethods ifNotNil: [:methods |
		instanceMethods := self removeIdenticalMethods: methods meta: false].
	classMethods ifNotNil: [:methods |
		classMethods := self removeIdenticalMethods: methods meta: true]