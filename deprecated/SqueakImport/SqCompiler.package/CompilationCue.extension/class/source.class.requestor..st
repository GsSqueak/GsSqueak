*SqCompiler-instance creation
source: aTextOrStream class: aClass requestor: anObject
	^ self 
		source: aTextOrStream 
		context: nil 
		receiver: nil
		class: aClass 
		environment: (aClass ifNotNil: [aClass environment])
		requestor: anObject
