saving
methodsIn: classProxy
	| methods |
	methods := classProxy messageCategoryDict values gather: [:values | 
					values collect: [:value |
						classProxy methodAt: value ifAbsent: []]].
	^ methods collect: [:meth | GSSMethodDefinition newFromMethodReference: meth]
