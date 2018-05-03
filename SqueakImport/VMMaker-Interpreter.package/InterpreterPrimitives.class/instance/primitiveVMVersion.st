other primitives
primitiveVMVersion
	"Answer a string corresponding to the version of virtual machine. This
	represents the version level of the Smalltalk source code (interpreter and various
	plugins) that is translated to C by a CCodeGenerator,  in addition to the external
	platform source code, typically written in C and managed separately for each platform.
	By convention, this is a string composed of the interpreter source version and the
	platform source version, e.g. '4.0.2-2172'.
	
	This is a named (not numbered) primitive in the null module (ie the VM)"
	
	| len versionString p |
	<export: true>
	<var: #p type: 'char *'>
	self isDefined: 'VM_VERSION'
		inSmalltalk: [versionString := '']
		comment: 'version level of interpreter plus platform support code'
		ifTrue: [len := self cCode: 'strlen(VM_VERSION)' inSmalltalk: [0].
			versionString := objectMemory instantiateClass: objectMemory classString indexableSize: len.
			p := self arrayValueOf: versionString.
			self cCode: 'strncpy(p, VM_VERSION, len)']
		ifFalse: [^self primitiveFail].
	self pop: 1 thenPush: versionString
