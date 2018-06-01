internal interpreter access
internalPushShadowCallStackStructure: structurePointer size: size 
	shadowCallStackPointer := shadowCallStackPointer - size.
	self
		lowcode_mem: shadowCallStackPointer
		cp: structurePointer
		y: size