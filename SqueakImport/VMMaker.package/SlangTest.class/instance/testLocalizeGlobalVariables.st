testing variable declaration
testLocalizeGlobalVariables
	"CCodeGenerator>>localizeGlobalVariables performs an optimization
	that may be misleading when introducing a new method. This test
	documents that optimization.
	
	If a method makes reference to an instance variable, and if this is the
	only method containing a reference to that variable, then the C translator
	will produce a local variable declaration in the generated function, and no
	global declaration will appear in the generated source file. This optimization
	is applied after inlining has been performed, so there are legitimate cases
	where a variable must be an instance variable referenced by two methods,
	but can be made local if those methods are inlined into a single method
	and only one method reference to the variable remains. See
	ObjectMemory>>markAndSweep: for an example."

	| stssi s |
	stssi := SlangTestSupportInterpreter inline: false.
	s := stssi asCString: #methodWithReferenceToVariables .
	"variable with one method reference is promoted to a local method variable"
	self assert: (s includesSubString: 'sqInt aVarWithOneReference;').
	"normal expected behavior, the variable is global in the generated source module."
	self deny: (s includesSubString: 'sqInt aVarWithTwoReferences;')
