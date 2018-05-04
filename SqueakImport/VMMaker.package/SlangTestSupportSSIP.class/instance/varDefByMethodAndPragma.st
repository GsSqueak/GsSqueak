type declaration
varDefByMethodAndPragma
	"SlangTestSupportSSIP asCString: #varDefByMethodAndPragma"

	| foo bar baz fum |
	<var: #baz type: 'float'>
	<var: #fum declareC: 'double fum'>
	self var: #foo type: 'char *'.
	self var: #bar declareC: 'unsigned int * bar'
