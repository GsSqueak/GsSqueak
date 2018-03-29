debug support
assertValidExecutionPointe: lip r: lifp s: lisp 
	self
		assertValidExecutionPointe: lip
		r: lifp
		s: lisp
		imbar: (self isMachineCodeFrame: lifp) not
		line: #'__LINE__'