message sending
superclassSend
	"Send a message to self, starting lookup with the superclass of the class
	 containing the currently executing method."
	"Assume: messageSelector and argumentCount have been set, and that
	 the receiver and arguments have been pushed onto the stack,"
	"Note: This method is inlined into the interpreter dispatch loop."
	<sharedCodeNamed: 'commonSupersend' inCase: 133>
	lkupClass := self superclassOf: (self methodClassOf: method).
	self assert: lkupClass ~~ objectMemory nilObject.
	self commonSend