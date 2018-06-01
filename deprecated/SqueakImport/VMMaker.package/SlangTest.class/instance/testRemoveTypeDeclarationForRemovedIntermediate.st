testing var decl requires memoryaccess
testRemoveTypeDeclarationForRemovedIntermediate
	"Document a bug in variable declaration. This is hard to reproduce, so the test uses
	the actual failure. Necessary conditions are to use MemoryAccess (requires deep
	inlining), then generate the entire interpreter. The error condition appears in the
	reverseDisplayFrom:to: method. Generating that method alone is not sufficient to
	reproduce the bug, the entire interpreter must first be generated, after which the
	method may be individually generated to inspect for the error condition. Symptoms
	are that #ptr, which is used as a sqInt, is incorrectly declared as (char *) due to a
	left over unreferenced declaration in one of the inlined methods.
	The bug exists as of VMMaker-dtl.342 and is corrected in VMMaker-dtl.343."

	| ma maState |
	ma := Smalltalk classNamed: #MemoryAccess.
	ma ifNil: [^ self
		"requires these accessors in combination with object memory / interpreter refactoring in order to reproduce bug"].
	maState := ma isEnabled.
	[ | s cg strm meth |
		ma enable.
		cg := CCodeGenerator new initialize.
		cg declareMethodsStatic: false.
		ContextInterpreter initializeCodeGenerator: cg.
		cg vmClass: ContextInterpreter.
		strm := ReadWriteStream on: ''.
		cg emitCCodeOn: strm doInlining: true doAssertions: false.
		meth := cg methodNamed: 'reverseDisplayFrom:to:' .
		strm := ReadWriteStream on: ''.
		meth emitCCodeOn: strm generator: cg.
		s := strm contents.
		self shouldnt: ('*char #ptr;*' match: s).
		self should: ('*sqInt ptr;*' match: s)
	] ensure: [maState
		ifTrue: [ma enable]
		ifFalse: [ma disable]]
	