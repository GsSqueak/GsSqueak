metaclass
indicateInstanceMessages
	"Indicate that the message selection should come from the class (instance) 
	messages."
	self okToChange ifTrue: [
		self metaClassIndicated: false]