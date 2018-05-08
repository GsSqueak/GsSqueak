LISP-primitives
lambda: aConsCell 
	"(lambda ARGS &rest BODY)
	Return a lambda expression.
	A call of the form (lambda ARGS &rest BODY) is self-quoting: the result
	of evaluating the lambda expression is the expression itself. 
	A lambda expression has the semantic of a function"
	^ self lambdaForm: #lambda withArgsAndBody: aConsCell
