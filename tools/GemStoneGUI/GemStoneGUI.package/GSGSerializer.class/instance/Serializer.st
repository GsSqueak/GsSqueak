primitive transformations
Serializer

	| transformations composites rules serializer |
	^ [:target :description |
		| type spec |
		description isAssociation
				ifTrue: [	type := description key.
						spec := description value]
				ifFalse: [type := description.
						spec := #()].
		(rules at: type ifAbsent: [nil])
			ifNotNil: [:rule | serializer value: target value: rule]
			ifNil: [
				target ifNil: [type := #Literal].
				(composites associationsDetect: [:assoc | 
					assoc key first = type and: [assoc key second = spec]] ifNone: [nil])
						ifNotNil: [:composite |
							(transformations at: #Composite)
								cull: target
								cull: spec
								cull: composite]
						ifNil: [
							(transformations at: type)
								cull: target
								cull: spec]]]