compiled methods
isExternalPrimitiveCall: aMethodObj 
	"Answer if the method is an external primtiive call (prim 117)."
	^ (self primitiveIndexOf: aMethodObj)
		= PrimNumberExternalCall