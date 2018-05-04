testing loop limits
testCallMethodTwiceWithLoopLimitThatMightBeModified
	"Two calls to a method with loop that might be modified generates a distinct
	loop limit variable for each."

	"(SlangTest selector: #testCallMethodTwiceWithLoopLimitThatMightBeModified) debug"

	| m1 sts lines |
	sts := SlangTestSupportInterpreter inline: true.
	m1 := (sts asCString: #callMethodTwiceWithLoopLimitThatMightBeModified)
			copyReplaceAll: 'callMethodTwiceWithLoopLimitThatMightBeModified'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 2.
	self should: (lines select: [:e | 'sqInt iLimiT;' = e withBlanksTrimmed]) size = 1.
	self should: (lines select: [:e | 'sqInt iLimiT1;' = e withBlanksTrimmed]) size = 1.

	sts := SlangTestSupportSSIP inline: true.
	m1 := (sts asCString: #callMethodTwiceWithLoopLimitThatMightBeModified)
			copyReplaceAll: 'callMethodTwiceWithLoopLimitThatMightBeModified'
			with: 'methodName'.
	lines := m1 findTokens: String cr.
	self should: (lines select: [:e | '*sqInt *LimiT*' match: e]) size = 2.
	self should: (lines select: [:e | 'sqInt iLimiT;' = e withBlanksTrimmed]) size = 1.
	self should: (lines select: [:e | 'sqInt iLimiT1;' = e withBlanksTrimmed]) size = 1.
