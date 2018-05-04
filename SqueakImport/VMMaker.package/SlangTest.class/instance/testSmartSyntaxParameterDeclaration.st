testing smart syntax
testSmartSyntaxParameterDeclaration
	"(SlangTest selector: #testSmartSyntaxParameterDeclaration) run"

	| s |
	s := (SlangTestSupportSSIP
			asInlinedCString: #declareInt:wordPointer: ).
	"parameter taken from the stack should be cast to (unsigned *)"
	self should: ['*pointerToWords = ((unsigned **) (interpreterProxy->firstIndexableField(interpreterProxy->stackValue(0))));*' match: s].
	"local variable declaration should match the data type as in the cast"
	self shouldnt: ['*usqInt **pointerToWords*' match: s]. "the buggy code generator renders it as 'usqInt *pointerToWords' "
	self should: ['*unsigned **pointerToWords*' match: s]. "it should be rendered as 'unsigned *pointerToWords' "
