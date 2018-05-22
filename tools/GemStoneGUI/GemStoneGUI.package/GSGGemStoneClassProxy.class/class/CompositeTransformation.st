serialization
CompositeTransformation

	self flag: #gsg. "Does not work, since no repository is set."
	^ [:class | 
		Array
			with: class thisClass name asSymbol
			with: class isMeta]