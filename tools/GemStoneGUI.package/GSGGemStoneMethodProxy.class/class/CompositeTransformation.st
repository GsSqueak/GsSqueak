serialization
CompositeTransformation

	^ [:method |
		| class selector envId |
		class := method inClass.
		selector := method selector.
		envId := method environmentId.
		{
			class name asSymbol.
			method selector.
			class isMeta.
			envId.
			class categoryOfSelector: selector environmentId: envId.
			method sourceString}]