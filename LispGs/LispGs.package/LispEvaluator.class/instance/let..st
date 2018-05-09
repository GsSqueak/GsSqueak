LISP-special forms
let: aConsCell 
	"(let VARLIST &rest BODY)
	Bind variables according to VARLIST then eval BODY.
	The value of the last form in BODY is returned.
	Each element of VARLIST is a symbol (which is bound to nil) or a list
	(SYMBOL VALUEFORM) (which binds SYMBOL to the value of
	VALUEFORM). All the VALUEFORMs are evaluated before any symbol is
	bound. 
	Named let idiom:
	
	(let name ((variable init) ...)
	expression
	expression ...)
	
	is equivalent to
	
	((letrec ((name
	(lambda (variable ...)
	expression
	expression ...)))
	name)
	init ...)"
	aConsCell first isSymbol
		ifFalse: [^ super let: aConsCell].
	"named let"
	^ self
		evalObject: ((ConsCell car: #'ulisp-named-let')
				append: aConsCell)
		multipleValue: true
