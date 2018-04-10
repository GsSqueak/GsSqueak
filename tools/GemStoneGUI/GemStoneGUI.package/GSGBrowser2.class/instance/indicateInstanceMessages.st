metaclass
indicateInstanceMessages
	"Indicate that the message selection should come from the class (instance) 
	messages."
	self okayToChange ifTrue: [
		self metaClassIndicated: false]