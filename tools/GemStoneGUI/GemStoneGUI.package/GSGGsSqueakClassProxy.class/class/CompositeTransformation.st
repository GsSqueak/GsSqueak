serialization
CompositeTransformation

	self flag: #gsg. "Does not work, since no repository is set."
	^ [:class | 
		Array
			with: (class thisClass perform: #name env: 7)
			with: class isMeta]