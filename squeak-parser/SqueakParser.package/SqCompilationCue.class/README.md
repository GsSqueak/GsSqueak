A CompilationCue is a helper class holding enough context for evaluating/compiling Smalltalk code.

That is mainly the source code, and the source code editor to interact with if the Compiler is used interactively.
But that is also any additional information necessary to resolve variable names.

When compiling a method, the Compiler typically need to know the target class in which to install the method.

When evaluating an expression, the Compiler also needs a receiver (for accessing the value of its instance variables), its class (for resolving instance/class variable names), and optionnally a context of execution when debugging a method (for accessing values of temporaries and parameters).

Instance Variables
	class:			<Behavior>
	context:		<Context | nil>
	environment:	<Environment | nil>
	receiver:		<Object>
	requestor:		<TextEditor | nil>
	source:			<Stream>

class
	- the target class in which to install the compiled method;
	  this enables to resolve the instance variable names, class variable names and shared pool variable names.
	  When evaluating, this should be the receiver class

context
	- the context introspected when evaluating the code: this is typically for accessing parameters and temporary variables when debugging

environment
	- the environment in which to resolve global variable names

receiver
	- the receiver into which to evaluate the code: this is typically for accessing instance variables in an inspector

requestor
	- typically the text editor containing the source code being compiled/evaluated. This enables the Compiler to interact in case of syntax error.

source
	- a ReadStream on the source code to be compiled
