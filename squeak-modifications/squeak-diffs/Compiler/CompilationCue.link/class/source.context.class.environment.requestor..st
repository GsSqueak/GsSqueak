instance creation
source: aTextOrStream context: aContext class: aClass environment: anEnvironment requestor: reqObject
	^ self basicNew
		initializeWithSource: aTextOrStream 
		context: aContext 
		receiver: (aContext ifNotNil: [aContext receiver]) 
		class: aClass 
		environment: anEnvironment 
		requestor: reqObject
