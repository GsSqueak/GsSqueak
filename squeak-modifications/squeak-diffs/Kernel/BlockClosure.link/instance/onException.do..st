evaluating
onException: anException do: handlerBlock
  "An optimized form of on:do: .  anException may not be any
  object which responds to  handles: 

  Private.

  Try to evaluate the receiver, which should be a zero-argument block.
  If an exception occurs which is matched by anExceptionClass,
  evaluate the one argument block handlerBlock , passing it the exception 
  instance as its argument.

  These forms are supported:
    (1) on: anException do: handlerBlock
    (2) on: anArray     do: handlerBlock
    (3) on: anExceptionSet do: handlerBlock
    (4) on: anArray     do: anArrayOfBlocks

   This form is not supported
    (5) on: anObject     do: handlerBlock

  anException must be the class Exception  or a subclass thereof ;
  anExceptionSet must be a kind of ExceptionSet;
  anArray must be a kind of Array ;
  handlerBlock must be an instance of ExecBloc ; if any of these
  is violated, the send of on:do: will fail with an error.

  anArrayOfBlocks must be an Array containing instances of ExecBloc ,
  the elements are not checked during the on:do: send , and are only
  checked if they are attempted to be evaluated during exception handling.
  
  In forms 2,3,4 elements of anArray or anExceptionSet which
  are not a kind of Exception, or an Array containing kinds of Exception,
  will silently have no effect on catching exceptions.

  In form 4, elements of anArray may in turn be Arrays of Exceptions.
  In form 4, the offset of the first element of anArray containing a 
  match to a signaled exception defines the offset in anArrayOfBlocks
  at which to find the handlerBlock to invoke.

  For forms 1,2,3 if handlerBlock expects more than 1 argument,
  an error is generated if exception handling attempts to
  invoke that handlerBlock.  

  For form 4, elements of anArrayOfBlocks must be instances of ExecBlock,
  otherwise the corresponding entry in anArray will silently have no effect 
  on catching exceptions.  If an element of anArrayOfBlocks is an ExecBlock
  taking more than 1 argument, an error is generated if exception 
  handling attempts to invoke that block.

  If handlerBlock is invoked to handle an Exception which occurs during
  execution of the receiver and handlerBlock completes normally , then
  the result of handlerBlock (value of last expression in handlerBlock)
  will be the result of the on:do: send .  Other-than-normal
  completion of handlerBlock is available by use of 
  Exception's instance methods such as
    #return  #return:  #retry #retryUsing: #resume #resume: #pass #outer 
  within handlerBlock 

  When searching for a handlerBlock to handle a signaled Exception, the VM
  uses Behavior>>_subclassOf: semantics . classHistories of the 
  class of the signaled Exception and of anException or elements of anExceptionSet
  are ignored.
"

  "marks frame with Exception_Mark_NIL, always fails"

  <primitive: 2018>
  ^ self value
