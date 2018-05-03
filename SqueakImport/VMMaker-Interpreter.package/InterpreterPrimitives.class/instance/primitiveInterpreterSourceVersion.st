other primitives
primitiveInterpreterSourceVersion
	"Answer a string corresponding to the version of the interpreter source. This
	represents the version level of the Smalltalk source code (interpreter and various
	plugins) that is translated to C by a CCodeGenerator, as distinct from the external
	platform source code, typically written in C and managed separately for each platform.
	This is a named (not numbered) primitive in the null module (ie the VM)"
	
	| len versionString p cString |
	<export: true>
	<var: #p type: 'char *'>
	<var: #cString type: 'char *'>
	cString := InterpreterSourceVersion.
	len := self cCode: 'strlen(cString)' inSmalltalk: [0].
	versionString := objectMemory instantiateClass: objectMemory classString indexableSize: len.
	p := self arrayValueOf: versionString.
	self cCode: 'strncpy(p, cString, len)'.
	self pop: 1 thenPush: versionString
