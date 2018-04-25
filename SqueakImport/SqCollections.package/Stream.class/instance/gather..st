enumerating
gather: block

	^ Generator on: [:g | 
		[self atEnd] whileFalse: [
			self next
				ifNil: [g yield: nil]
				ifNotNil: [:object |
					(block value: object) do: [:ea |
						g yield: ea]]]]