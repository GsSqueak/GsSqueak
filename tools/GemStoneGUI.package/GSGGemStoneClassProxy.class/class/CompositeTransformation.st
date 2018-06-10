serialization
CompositeTransformation

	self flag: #gsg. "Does not work, since no repository is set."
	^ [:class |
		{
			class thisClass name asSymbol.
			class isMeta}]