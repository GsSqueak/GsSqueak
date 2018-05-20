serialization
CompositeTransformation

	^ [:method |
		| class selector envId |
		class := method inClass.
		selector := method selector.
		envId := method environmentId.
		{class.
		method selector.
		envId.
		class categoryOfSelector: selector environmentId: envId}]