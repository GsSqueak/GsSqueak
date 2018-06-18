diffing
collectDiffsFromClass: targetClass to: sourceClass

	| diff sourceMethods targetMethods methodDict |
	diff := GSGClassDiff fromClass: targetClass to: sourceClass.
	self addDiff: diff.
	sourceClass ifNil: [^ self].
	sourceMethods := self collectMethodsIn: sourceClass.
	targetMethods := self collectMethodsIn: targetClass.
	methodDict := self mergeDictionary: targetMethods with: sourceMethods.
	methodDict do: [:array |
		self addMethodDiff: (GSGMethodDiff fromMethod: array first to: array second)]