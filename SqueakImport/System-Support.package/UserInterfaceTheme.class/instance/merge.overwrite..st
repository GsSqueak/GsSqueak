building
merge: aUserInterfaceTheme overwrite: aBoolean 
	"Merge aUserInterfaceTheme into my properties. Only overwrite properties if it sais so."
	
	self
		 validateCanMerge: aUserInterfaceTheme ;
		 preMerge: aUserInterfaceTheme.

	self atomicUpdate: [:props |
		aUserInterfaceTheme properties keysAndValuesDo: [:key :value |
			(aBoolean or: [(props includesKey: key) not])
				ifTrue: [ | mergedValue |
					mergedValue := value copy.
					"Update receiver when deriving properties."
					mergedValue isMessageSend ifTrue: [mergedValue receiver: self].
					props at: key put: mergedValue.
					]]].