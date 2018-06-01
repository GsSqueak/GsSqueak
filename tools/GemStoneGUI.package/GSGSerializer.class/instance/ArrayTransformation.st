primitive transformations
ArrayTransformation

	| serializer |
	^ [:array :spec |
		| output |
		output := String new.
		output add: $[.
		array asArray doWithIndex: [:element :index |
			| elementDescription |
			index > 1 ifTrue: [output add: $,].
			elementDescription := spec at: (index min: spec size).
			output add: (serializer value: element value: elementDescription)].
		output add: $].
		output]