inlining
inlineByPragma
	"SlangTestSupportSSIP asCString: #inlineByPragma"
	"SlangTestSupportSSIP asInlinedCString: #inlineByPragma"

	| bar foo |
	foo := self methodThatShouldBeInlinedByPragma.
	bar := self methodThatShouldNotBeInlinedByPragma