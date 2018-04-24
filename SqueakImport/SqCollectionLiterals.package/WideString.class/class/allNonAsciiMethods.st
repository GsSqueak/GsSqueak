enumeration
allNonAsciiMethods

	^CurrentReadOnlySourceFiles cacheDuring: [
		self systemNavigation allMethodsSelect: [ :method |
			method getSource asString isAsciiString not ] ]