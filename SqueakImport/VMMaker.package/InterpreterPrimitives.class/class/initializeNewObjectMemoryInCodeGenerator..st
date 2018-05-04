translation
initializeNewObjectMemoryInCodeGenerator: cg
	"Add the object memory as an instance variable of the interpreter, with
	a back pointer from object memory to interpreter."

	cg addClass: NewObjectMemory upTo: VMClass asInstanceVariable: #objectMemory.
	"references from ObjectMemory to #interpreter are local functions in generated code"
	cg mapVar: #interpreter asInstanceOf: ClassicObjectMemory to: 'self'.
	"references from NewObjectMemory to #coInterpreter are local functions in generated code"
	^cg mapVar: #coInterpreter asInstanceOf: ClassicObjectMemory to: 'self'
