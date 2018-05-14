LISP-special forms
letStar: aConsCell 
	"(let* VARLIST &rest BODY)
	Bind variables according to VARLIST then eval BODY.
	The value of the last form in BODY is returned.
	Each element of VARLIST is a symbol (which is bound to nil) or a list
	(SYMBOL VALUEFORM) (which binds SYMBOL to the value of
	VALUEFORM). Each VALUEFORM can refer to the symbols already
	bound by this VARLIST."
	| bindings body |
	aConsCell car ifNil: [^ self let: aConsCell].
	bindings := aConsCell car topForms.
	body := aConsCell cdr ifNil: [^ nil].
	bindings reverseDo: [:b | body := {{#let. {b}} asCons append: body} asCons].
	^ self let: body cdar
