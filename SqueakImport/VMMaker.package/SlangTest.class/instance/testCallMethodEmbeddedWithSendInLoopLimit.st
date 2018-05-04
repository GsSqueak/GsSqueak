testing loop limits
testCallMethodEmbeddedWithSendInLoopLimit
	"A loop embedded in a loop with two loop limit variables generated"

	"(SlangTest selector: #testCallMethodEmbeddedWithSendInLoopLimit) debug"

	| m1 sts lines |
	sts := SlangTestSupportInterpreter inline: true.
	m1 := (sts asCString: #callMethodEmbeddedWithSendInLoopLimit)
			copyReplaceAll: 'callMethodEmbeddedWithSendInLoopLimit'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 2.
	self should: (lines select: [:e | 'sqInt iLimiT;' = e withBlanksTrimmed]) size = 1.
	self should: (lines select: [:e | 'sqInt kLimiT;' = e withBlanksTrimmed]) size = 1.

	sts := SlangTestSupportPlugin inline: true.
	m1 := (sts asCString: #callMethodEmbeddedWithSendInLoopLimit)
			copyReplaceAll: 'callMethodEmbeddedWithSendInLoopLimit'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 2.
	self should: (lines select: [:e | 'sqInt iLimiT;' = e withBlanksTrimmed]) size = 1.
	self should: (lines select: [:e | 'sqInt kLimiT;' = e withBlanksTrimmed]) size = 1.

	sts := SlangTestSupportSSIP inline: true.
	m1 := (sts asCString: #callMethodEmbeddedWithSendInLoopLimit)
			copyReplaceAll: 'callMethodEmbeddedWithSendInLoopLimit'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 2.
	self should: (lines select: [:e | 'sqInt iLimiT;' = e withBlanksTrimmed]) size = 1.
	self should: (lines select: [:e | 'sqInt kLimiT;' = e withBlanksTrimmed]) size = 1.