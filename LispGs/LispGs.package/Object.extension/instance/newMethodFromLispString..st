*LispGs
newMethodFromLispString: aString
  | parser source meth selector isLambda array |
  (aString startsWith: '(define')
    ifFalse: [ ^ LispEvaluator lispError: 'use (define ...) for method definition' ].
  LispEvaluator eval: aString.
  array := (RBParser parseExpression: '#' , aString) value.
  selector := array at: 2.
  (((array at: 3) isKindOf: Collection)
    and: [ (array at: 3) first == #'lambda' ])
    ifFalse: [ 
      source := selector
        ,
          '
	^ LispEvaluator @env0: evaluate: #' , selector ]
    ifTrue: [ 
      source := selector
        ,
          ': args
	| argArray |
	(args @env0: isKindOf: Collection)
	@env0: ifTrue: [argArray := Array @env0: withAll: args]
			ifFalse: [argArray := Array @env0: with: args].
argArray @env0: insertObject: #'
        , selector
        ,
          ' at: 1.
	^ LispEvaluator @env0: evaluate: (LispEvaluator @env0: rewrite: argArray @env0: asCons)' ].
  meth := Object
    compileMethod: source
    dictionaries: GsSession currentSession symbolList
    category: 'Lisp'
    environmentId: 2.
  System commit.
  ^ meth