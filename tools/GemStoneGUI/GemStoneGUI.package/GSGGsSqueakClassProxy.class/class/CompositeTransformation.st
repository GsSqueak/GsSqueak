serialization
CompositeTransformation

	self flag: #gsg. "Does not work, since no repository is set."
	^ [:class | 
		Array
			with: ((Smalltalk at: #SqueakEnvironment) keyAtValue: class thisClass)
			with: class isMeta]