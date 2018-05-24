primitive transformations
CompositeTransformation

	| transformations serializer |
	^ [:target :spec :composite |
		| serializedArray |
		((transformations at: composite key first) cull: target cull: spec)
			ifNil: [serializer cull: target cull: #Nil]
			ifNotNil: [:transformedTarget |
				transformedTarget isCollection ifFalse: [^ self error: 'Failed Serialization: Faulty composite structure'].
				serializedArray := serializer cull: transformedTarget cull: (#Array -> composite value).
				String new
					addAll: serializedArray;
					add: $(;
					add: composite key first asString;
					add: $);
					yourself]]