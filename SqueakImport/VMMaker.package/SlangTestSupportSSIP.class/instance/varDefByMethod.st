type declaration
varDefByMethod
	"SlangTestSupportSSIP asCString: #varDefByMethod"

	| foo bar |
	self var: #foo type: 'char *'.
	self var: #bar declareC: 'unsigned int * bar'
