LISP-special forms
setD: aConsCell 
	"(set! SYMBOL VALUE)
	Changes the value bound to SYMBOL to VALUE.
	An error is raised if SYMBOL is not bound.
	
	(set! (PROC ...) VALUE)
	Generalized setter: equivalent to ((setter PROC) ... VALUE)"
	| binding val sym |
	aConsCell car isConsCell
		ifTrue: [^ self
				evalObject: (((#setter inCons append: aConsCell caar inCons) inCons append2: aConsCell cdar)
						append: aConsCell cdr)].
	sym := self checkSymbol: aConsCell car.
	binding := self environment scopedSymbolBinding: sym.
	binding
		ifNil: [self lispError: 'unbound symbol ' , sym].
	binding value: (val := self evalObject: aConsCell cadr).
	^ val
