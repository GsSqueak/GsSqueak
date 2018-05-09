private - initialization
initialize
	self environment: LispEnvironment new.
	constantVariables := #().
	self definePrimitiveAliases.
	self class primitives
		do: [:prim | self symbolValuesAdd: prim -> (LispPrimitive selector: prim for: self class)]
