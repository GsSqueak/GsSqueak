new api - classes
superclassFor: classProxy env: envId

	| code topazOutput superclassName |
	code := '(' , classProxy codeReferencingMe , ' superclassForEnv: ' , envId , ') ' ,
				'ifNotNil: [:class | class name]'.
	self setEnv: 0.
	topazOutput := self run: code.
	superclassName := topazOutput at: 1.
	^ superclassName = 'nil'
		ifTrue: [self convertToClassProxy: superclassName 
					inEnvironment: classProxy environment]
		ifFalse: [nil]