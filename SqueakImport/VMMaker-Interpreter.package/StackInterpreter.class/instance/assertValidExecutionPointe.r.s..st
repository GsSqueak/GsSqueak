debug support
assertValidExecutionPointe: lip r: lifp s: lisp
	<var: #lip type: #'usqInt'>
	<var: #lifp type: #'char *'>
	<var: #lisp type: #'char *'>
	self assertValidExecutionPointe: lip r: lifp s: lisp imbar: (self isMachineCodeFrame: lifp) not