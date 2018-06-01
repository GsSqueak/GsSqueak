printing
constructorString

	^ String streamContents: [:s | self printConstructorOn: s indent: 0].
