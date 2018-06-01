testing loop limits
testCallMethodWithLoopLimitThatIsNotModified
	"A call to a method with loop with a constant loop limit does not require a
	loop limit variable."

	"(SlangTest selector: #testCallMethodTwiceWithSendInLoopLimit) debug"

	| m1 sts lines |
	sts := SlangTestSupportInterpreter inline: true.
	m1 := (sts asCString: #callMethodWithLoopLimitThatIsNotModified)
			copyReplaceAll: 'callMethodWithLoopLimitThatIsNotModified'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 0.
	self should: (lines select: [:e | 'for (i = 0; i <= 10; i += 1) {' = e withBlanksTrimmed]) size = 1.

	sts := SlangTestSupportPlugin inline: true.
	m1 := (sts asCString: #callMethodWithLoopLimitThatIsNotModified)
			copyReplaceAll: 'callMethodWithLoopLimitThatIsNotModified'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 0.
	self should: (lines select: [:e | 'for (i = 0; i <= 10; i += 1) {' = e withBlanksTrimmed]) size = 1.

	sts := SlangTestSupportSSIP inline: true.
	m1 := (sts asCString: #callMethodWithLoopLimitThatIsNotModified)
			copyReplaceAll: 'callMethodWithLoopLimitThatIsNotModified'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 0.
	self should: (lines select: [:e | 'for (i = 0; i <= 10; i += 1) {' = e withBlanksTrimmed]) size = 1.
