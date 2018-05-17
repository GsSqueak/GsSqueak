dependency sorting
requirements

	^ self superclass 
		ifNil: [Array new]
		ifNotNil: [:req | Array with: req]