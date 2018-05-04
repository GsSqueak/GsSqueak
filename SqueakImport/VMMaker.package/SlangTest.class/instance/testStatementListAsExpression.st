testing interpreter
testStatementListAsExpression
	"When a list of statements is used in a target block of an ifTrue:ifFalse: or
	similar, use comma as the statement separator in the generated C.
	Motivated by #objCouldBeClassObj: implementation in oscog."

	"(SlangTest selector: #testStatementListAsExpression) debug"

	| stssi s |
	stssi := SlangTestSupportInterpreter inline: true.
self halt.
	s := stssi asCString: #statementListAsExpression.

	self deny: ['*BAR;*BAZ*' match: s]. "terminator character following BAR should not be a semicolon"
	self assert: ['*BAR,*BAZ*' match: s]. "instead,use comma to separate statements within expression"
