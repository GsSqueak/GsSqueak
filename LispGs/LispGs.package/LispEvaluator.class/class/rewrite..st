rewriting
rewrite: anObject
  "mostly useful when anObject has been freshly created by sending
	#asCons to an hand-writen Array of lisp code
	
	this rewriting procedure handles syntactic sugar such as dotted pair
	notation, the direct usage of ,@ or ` within an Array, or using
	compound symbols such as this-one, plus more...
	
	without rewriting, the lisp-like Array
	#(setq an-example `(1 + ,some-var)) 
	would need to be written
	#(setq #'an-example' (quasiquote (1 + (unquote #'some-var'))))
	
	see by yourself by inspecting or printing the following: 
	
	#(setq an-example `(1 + ,some-var)) asCons
	LispKernel rewrite: #(setq an-example `(1 + ,some-var)) asCons
	#(setq #'an-example' (quasiquote (1 + (unquote #'some-var'))))
	asCons "

  | datacode |
  datacode := anObject.
  datacode := self recRewrite: datacode.
  datacode := self recRewrite2: datacode.
  ^ datacode