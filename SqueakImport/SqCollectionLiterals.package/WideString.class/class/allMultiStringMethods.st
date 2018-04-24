enumeration
allMultiStringMethods  

	^CurrentReadOnlySourceFiles cacheDuring: [
		self systemNavigation allMethodsSelect: [ :method |
			method getSource asString isOctetString not ] ]