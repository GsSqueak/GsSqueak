testing preprocessor directives
testPreprocessorExpression
	"Test preprocessorExpression: "

	"(SlangTest selector: #testPreprocessorExpression) run"

	| stssi cString |
	self flag: #FIXME. "See redundant implementation in oscog #cPreprocessorDirective: "

	stssi := SlangTestSupportInterpreter inline: false.
	cString := stssi asCString: #preprocessorExpression.
	self should: ('*# define FOO bar*' match: cString).
	self should: ((cString findTokens: Character cr) select: [:e | e = '# define FOO bar' ]) size = 1.
	self should: ((cString findTokens: Character cr) select: [:e | e = '## define FOO bar' ]) size = 0.
