C code generation
emitCCodeOn: aStream generator: aCodeGen
	"Emit C code for this method onto the given stream. All calls to inlined methods should already have been expanded."

	aCodeGen currentMethod: self.
	self emitCCommentOn: aStream.	"place method comment before function"
	self emitCHeaderOn: aStream generator: aCodeGen.
	parseTree emitCCodeOn: aStream level: 1 generator: aCodeGen.
	"Ensure code is POSIX compliant"
	(self returnType = #void or: [self endsWithReturn]) ifFalse: [aStream tab: 1; nextPutAll: 'return null;'; cr].
	aStream nextPutAll: '}'; cr.