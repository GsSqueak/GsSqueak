*VMMaker-translation support
preprocessorExpression: directive
	"For translation only; noop when running in Smalltalk.
	When translated, emits directive as a C preprocessor directive.

	Example usage:

	self preprocessorExpression: 'ifdef HAS_FOO'.
	self doFooStuff.
	self preprocessorExpression: 'endif'.
	
	Generated C code:
	
	# ifdef HAS_FOO
		doFooStuff();
	# endif
	"