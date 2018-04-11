metaclass
indicateClassMessages
	"Indicate that the message selection should come from the metaclass 
	messages."
	self okayToChange ifTrue: [
		self metaClassIndicated: true]