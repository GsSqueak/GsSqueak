testing loop limits
testCallMethodWithLoopLimitThatMightBeModified
	"A call to a method with loop with a loop limit that might be modified by the loop
	body requires a loop limit variable."

	"(SlangTest selector: #testCallMethodWithLoopLimitThatMightBeModified) debug"

	| m1 sts lines |
	sts := SlangTestSupportInterpreter inline: true.
	m1 := (sts asCString: #callMethodWithLoopLimitThatMightBeModified)
			copyReplaceAll: 'callMethodWithLoopLimitThatMightBeModified'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 1.
	self should: (lines select: [:e | 'sqInt iLimiT;' = e withBlanksTrimmed]) size = 1.

	sts := SlangTestSupportPlugin inline: true.
	m1 := (sts asCString: #callMethodWithLoopLimitThatMightBeModified)
			copyReplaceAll: 'callMethodWithLoopLimitThatMightBeModified'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 1.
	self should: (lines select: [:e | 'sqInt iLimiT;' = e withBlanksTrimmed]) size = 1.

	sts := SlangTestSupportSSIP inline: true.
	m1 := (sts asCString: #callMethodWithLoopLimitThatMightBeModified)
			copyReplaceAll: 'callMethodWithLoopLimitThatMightBeModified'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 1.
	self should: (lines select: [:e | 'sqInt iLimiT;' = e withBlanksTrimmed]) size = 1.
