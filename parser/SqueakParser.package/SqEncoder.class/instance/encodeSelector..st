encoding
encodeSelector: aSelector 
	^ self
		name: aSelector
		key: aSelector
		class: SqSelectorNode
		type: SendType
		set: selectorSet