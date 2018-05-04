accessing
isExpression
	"Answer the value of isExpression. True if this node is expected to be used
	as an expression. Normally false but may be set by #asExpression to indicate
	that this node should be translated as a simple expression rather than as
	a statement."

	^ isExpression ifNil: [isExpression := false]