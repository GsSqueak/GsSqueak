metaclass
indicateClassMessages
	"Indicate that the message selection should come from the metaclass 
	messages."
	self okToChange ifTrue: [
		self metaClassIndicated: true]