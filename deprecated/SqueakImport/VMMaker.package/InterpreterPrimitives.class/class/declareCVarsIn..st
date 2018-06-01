translation
declareCVarsIn: aCCodeGenerator
	"Return types for primitives referenced in primitiveTable must be properly declared as
	functions returning void. Ideally these should be declared with returnTypeC: pragmas
	in the primitive implementations, but for convenience the (possibly missing) declarations
	are overridden here."

	self primitiveTable do:
		[:symbolOrNot|
		(symbolOrNot isSymbol
		 and: [symbolOrNot ~~ #primitiveFail]) ifTrue:
			[(aCCodeGenerator methodNamed: symbolOrNot) ifNotNil:
				[:tMethod| tMethod returnType: #void]]].
