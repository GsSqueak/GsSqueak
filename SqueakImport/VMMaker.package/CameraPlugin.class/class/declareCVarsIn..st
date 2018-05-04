translation
declareCVarsIn: aCCodeGenerator
	"self translate"

	super declareCVarsIn: aCCodeGenerator.
	aCCodeGenerator addHeaderFile: '<string.h>'.