LISP-special forms
cond: aConsCell 
	"(cond &rest CLAUSES)
	Try each clause until one succeeds.
	Each clause normally look like (CONDITION &rest BODY). CONDITION is
	evaluated and, if the value is non-nil, this clause succeeds:
	then the expressions in BODY are evaluated and the last one's
	value is the value of the cond-form.
	Special clauses are:
	(CONDITION => EXPRESSION)
	(else EXPRESSION)
	
	If no clause succeeds, cond returns nil.
	If a clause has one element, as in (CONDITION),
	CONDITION's value if non-nil is returned from the cond-form."
	aConsCell
		do: [:clause | 
			| v |
			v := clause first == #else
						ifTrue: [self trueValue]
						ifFalse: [self evalObject: clause first].
			v == self falseValue
				ifFalse: [clause cdr
						ifNil: [^ v].
					clause cadr == #=>
						ifTrue: [^ self
								evalTailObject: ((self evalObject: clause cdr cdr car) inCons addLast: v inQuotedCons)].
					clause cdr
						doWithCdr: [:c :cdr | 
							cdr
								ifNil: [^ self evalTailObject: c].
							self evalObject: c]]].
	^ self falseValue
