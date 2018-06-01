*SqCompiler-instance creation
source: aTextOrStream context: aContext class: aClass requestor: anObject
	^ self 
		source: aTextOrStream 
		context: aContext 
		receiver: (aContext ifNotNil: [aContext receiver])
		class: aClass 
		environment: (aClass ifNotNil: [aClass environment])
		requestor: anObject
