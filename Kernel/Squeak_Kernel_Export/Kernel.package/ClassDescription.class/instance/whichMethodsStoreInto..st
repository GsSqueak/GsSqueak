testing
whichMethodsStoreInto: varName 
	"Answer a collection of CompiledMethod whose methods access the argument, varName,
	 as a named class or pool variable. Or let super try with a named instance variable."
	^(self bindingOf: varName)
		ifNil: [super whichMethodsStoreInto: varName]
		ifNotNil: [:ref| self methodDict values select: [:eachMethod| eachMethod writesRef: ref]]