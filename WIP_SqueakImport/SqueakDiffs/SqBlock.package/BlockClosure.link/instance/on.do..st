evaluating
on: exceptionSelector do: handlerBlock
  "Try to evaluate the receiver, which should be a zero-argument block.
  If an exception occurs and the expression
      exceptionSelector handles: theExceptionInstance
  returns true, then evaluate the one argument block handlerBlock , 
  passing it the exception instance as its argument.

  Two forms are supported directly by the VM, and the 'fast path code'
  below is used.
    (1) on: anException do: handlerBlock
    (2) on: anExceptionSet do: handlerBlock
  A third form is handled by Smalltalk code in the body of this method,
  and for this form only, #handles is sent to anObject to determine
  whether an exception should be handled .
    (3) on: anObject     do: handlerBlock

  anException must be the class Exception  or a subclass thereof ;
  anExceptionSet must be a kind of ExceptionSet;
  handlerBlock must be an instance of ExecBloc otherwise an error is generated.

  For forms 1,2,3 if handlerBlock expects more than 1 argument,
  an error is generated if exception handling attempts to
  invoke that handlerBlock.  

  If handlerBlock is invoked to handle an Exception which occurs during
  execution of the receiver and handlerBlock completes normally , then
  the result of handlerBlock (value of last expression in handlerBlock)
  will be the result of the on:do: send .  Other-than-normal
  completion of handlerBlock is available by use of 
  Exception's instance methods such as
    #return  #return:  #retry #retryUsing: #resume #resume: #pass #outer 
  within handlerBlock 

  For forms 1 and 2, when searching for a handlerBlock to handle a signaled Exception, 
  the VM uses Behavior>>_subclassOf: semantics . classHistories of the 
  class of the signaled Exception and of anException or elements of anExceptionSet
  are ignored.
"

  "always fails"

  <primitive: 2030>
  | fastPath |
  "fastPath := true by primitive if form 1 or 2 detected"
  "fastPath := nil  by primitive if form 3 detected."
  fastPath
    ifNotNil: [ 
      "fast path code"
      ^ self value ].	"Any changes to this method's code before this line may also
 require changes to code in comgen.c conditional on BcPrim_ENTER_onDo .
"
  ^ self onException: AbstractException
    do: [ :ex | 
      (exceptionSelector handles: ex)
        ifTrue: [ 
          handlerBlock argumentCount == 0
            ifTrue: [ handlerBlock value ]
            ifFalse: [ handlerBlock value: ex ] ]
        ifFalse: [ ex pass ] ]
