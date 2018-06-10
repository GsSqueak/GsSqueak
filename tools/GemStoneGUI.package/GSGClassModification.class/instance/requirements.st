dependencies
requirements

	| requirements |
	requirements := Set with: self oldVersion name.
	self newVersion superclassName ~= self oldVersion superclassName
		ifFalse: [requirements add: self newVersion superclassName].
	requirements addAll: (self newVersion poolDictionaryNames
							difference: self oldVersion poolDictionaryNames).
	^ requirements asArray