other primitives
primitivePlatformSourceVersion
	"Answer a string corresponding to the version of the external platform source
	code, typically written in C and managed separately for each platform.
	This is a named (not numbered) primitive in the null module (ie the VM)"
	| len versionString p |
	<export: true>
	<var: #p type: 'char *'>
	self isDefined: 'PLATFORM_SOURCE_VERSION'
		inSmalltalk: [versionString := '']
		comment: 'version level of platform support code'
		ifTrue: [len := self cCode: 'strlen(PLATFORM_SOURCE_VERSION)' inSmalltalk: [0].
			versionString := objectMemory instantiateClass: objectMemory classString indexableSize: len.
			p := self arrayValueOf: versionString.
			self cCode: 'strncpy(p, PLATFORM_SOURCE_VERSION, len)']
		ifFalse: [^self primitiveFail].
	self pop: 1 thenPush: versionString