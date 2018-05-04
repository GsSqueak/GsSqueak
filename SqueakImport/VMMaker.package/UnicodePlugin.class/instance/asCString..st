utility
asCString: stringOop
	"Return a C char * pointer into the given Squeak string object."
	"Warning: A Squeak string is not necessarily null-terminated."
	"Warning: the resulting pointer may become invalid after the next garbage collection and should only be using during the current primitive call."

	<inline: false>
	<returnTypeC: 'char *'>

	((interpreterProxy isIntegerObject: stringOop) or:
	 [(interpreterProxy isBytes: stringOop) not]) ifTrue: [
		interpreterProxy success: false.
		^ 0].

	^ self cCoerce: (interpreterProxy firstIndexableField: stringOop) to: 'char *'
