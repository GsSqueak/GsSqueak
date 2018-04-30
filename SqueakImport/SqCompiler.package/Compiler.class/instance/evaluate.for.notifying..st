public access
evaluate: textOrString for: anObject notifying: aController
	"Compile and execute the argument, textOrString with respect to the class 
	of anObject. If a compilation error occurs, notify aController."

	^ self
		evaluate: textOrString
		in: nil
		to: anObject
		notifying: aController
		ifFail: [^nil]