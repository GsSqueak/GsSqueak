private - initialization
definePrimitiveAliases
	"defines functions for primitives with lispish names, so that we can do
	for example
	(defun myCons (x y) (cons x y))
	instead of
	(defun: myCons (x y) (cons: x y))
	
	in #installPrimitiveAliases: care is taken not to override the possibly
	already existing definition of the alias symbol, so that the overall effect
	of sending this message to a running interpreter is simply to register
	newly created primitives and have them available on-the-fly"
	self
		installPrimitiveAliases: (self class primitives
				select: [:prim | prim last == $:]
				thenCollect: [:prim | (self class aliasForPrimitive: prim)
						-> (LispPrimitive selector: prim for: self class)])
