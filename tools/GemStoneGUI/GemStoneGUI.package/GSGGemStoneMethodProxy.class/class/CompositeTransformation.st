serialization
CompositeTransformation

	^ [:method |
		| class selector envId |
		class := method inClass.
		selector := method selector.
		envId := method environmentId.
		Array 
			with: class
			with: method selector
			with: envId
			with: (class categoryOfSelector: selector environmentId: envId)]