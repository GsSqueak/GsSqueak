testing variable declaration
testExportsForSqueak3D
	"If the code generator is not properly initialized in the special case of
	B3DEnginePlugin, the exports table will be incorrect in the generated code.
	Some versions of VMMaker had this problem, this test is to ensure that the
	problem stays fixed."

	Smalltalk at: #B3DEnginePlugin ifPresent: [:squeak3D | | src |
		src := squeak3D asCString.
		self assert: ( '*"Squeak3D", "setInterpreter", (void*)setInterpreter*' match: src)]
