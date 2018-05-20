serialization
CompositeTransformation

	^ [:class | 
		{class thisClass name asSymbol.
		class isMeta}]