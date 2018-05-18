private-exceptions
isHandlerContext
  "is this context for  method that is marked?"

  | meth |
  ^ (meth := self gsMethod)
	ifNil: [false]
	ifNotNil: [meth _isPrimitive
    	    ifTrue: [ (meth _primitive at: 1) == 2030 ]
    	    ifFalse: [ false ]]
