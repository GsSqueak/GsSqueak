enumerating
collect: block

	^ Generator on: [:g | 
		[self atEnd] whileFalse: [
			g yield: (self next
				ifNil: [nil]
				ifNotNil: [:object | block value: object])]]