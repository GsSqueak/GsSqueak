*SqCompiler-instance creation
class: aClass
	^ self 
		source: nil
		context: nil
		receiver: nil
		class: aClass
		environment: (aClass ifNotNil: [aClass environment])
		requestor: nil
