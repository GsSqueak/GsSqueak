C code generator
emitCCodeOn: aStream doInlining: inlineFlag doAssertions: assertionFlag
	super emitCCodeOn: aStream doInlining: inlineFlag doAssertions: assertionFlag.

	"if the machine needs the globals structure defined locally in the interp.c file, don't add the folowing function"
	localStructDef ifFalse:[self emitStructureInitFunctionOn: aStream]