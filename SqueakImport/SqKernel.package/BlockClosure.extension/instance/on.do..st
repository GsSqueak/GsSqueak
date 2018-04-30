*SqKernel-exceptions
on: exceptionOrExceptionSet do: handlerAction
	"Evaluate the receiver in the scope of an exception handler."

	<primitive: 2030> "always fails"
	| fastPath | "fastPath := true by primitive if form 1 or 2 detected"
		     "fastPath := nil  by primitive if form 3 detected."
	fastPath ifNotNil:[ "fast path code"
	 ^ self value
	].
	"Any changes to this method's code before this line may also
	 require changes to code in comgen.c conditional on BcPrim_ENTER_onDo .
	"
	^ self _env0 onException: Exception do:[:ex |
	    (exceptionOrExceptionSet handles: ex) ifTrue:[
	      handlerAction argumentCount == 0 
		 ifTrue:[ handlerAction value ]
		ifFalse:[ handlerAction value: ex ]
	    ] ifFalse:[
	      ex pass
	    ]
	  ]

