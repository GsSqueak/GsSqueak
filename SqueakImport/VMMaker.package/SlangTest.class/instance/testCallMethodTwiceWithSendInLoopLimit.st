testing loop limits
testCallMethodTwiceWithSendInLoopLimit
	"Two calls to a method with loop with loop limit that is a method send can
	share the same loop limit variable."

	"(SlangTest selector: #testCallMethodTwiceWithSendInLoopLimit) debug"

	| m1 sts lines |
	sts := SlangTestSupportInterpreter inline: true.
	m1 := (sts asCString: #callMethodTwiceWithSendInLoopLimit)
			copyReplaceAll: 'callMethodTwiceWithSendInLoopLimit'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 1.
	self should: (lines select: [:e | 'sqInt iLimiT;' = e withBlanksTrimmed]) size = 1.

	sts := SlangTestSupportPlugin inline: true.
	m1 := (sts asCString: #callMethodTwiceWithSendInLoopLimit)
			copyReplaceAll: 'callMethodTwiceWithSendInLoopLimit'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 1.
	self should: (lines select: [:e | 'sqInt iLimiT;' = e withBlanksTrimmed]) size = 1.

	sts := SlangTestSupportSSIP inline: true.
	m1 := (sts asCString: #callMethodTwiceWithSendInLoopLimit)
			copyReplaceAll: 'callMethodTwiceWithSendInLoopLimit'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 1.
	self should: (lines select: [:e | 'sqInt iLimiT;' = e withBlanksTrimmed]) size = 1.
