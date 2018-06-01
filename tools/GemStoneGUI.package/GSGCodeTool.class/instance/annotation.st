annotation
annotation

	^ self currentMethod
		ifNil: ['']
		ifNotNil: [:method | self annotationForMethod: method]