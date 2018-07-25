instance creation
source: aTextOrStream context: aContext receiver: recObject class: aClass environment: anEnvironment requestor: reqObject
	^ self basicNew
		initializeWithSource: aTextOrStream 
		context: aContext 
		receiver: recObject 
		class: aClass 
		environment: anEnvironment 
		requestor: reqObject
