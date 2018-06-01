instance creation
source: aString environment: anEnvironment 
	^ self
		source: aString
		context: nil
		receiver: nil
		class: UndefinedObject
		environment: anEnvironment
		requestor: nil