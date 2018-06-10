dependencies
requirements

	| requirements |
	requirements := Set with: self newVersion superclassName.
	requirements addAll: self newVersion poolDictionaryNames.
	^ requirements asArray