entry points
evaluate: anObject 
	"entry point to the Lisp interpreter. 
	
	anObject can be any acceptable data for Lisp. it is evaluated as is,
	without being converted nor transformed.
	
	because it is an entry point to the interpreter context, #evaluate:
	should never be sent from within a Lisp program; it should not be
	used by any primitive. use #evalObject: instead.
	
	see #enterInterpreterContextAndEval: for the rationale"
	^ self enterInterpreterContextAndEval: anObject