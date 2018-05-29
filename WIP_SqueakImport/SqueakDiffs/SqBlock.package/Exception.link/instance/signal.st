signaling
signal

  "The current stack is searched for an 'exception handler' which matches
  the receiver.  The search proceeds from the top of stack downwards,
  and then checks the static legacy handlers.

  ANSI handlers are installed by using
    ExecBlock>>on:do:    installs an ANSI handler 
    ExecBlock>>onException:do:    installs an ANSI handler 
  ANSI static handlers may be installed by
    AbstractException(C)>>defaultAction:
  Legacy handlers may be installed by 
    AbstractException(C)>>category:number:do:
  Legacy static handlers may be installed by
    AbstractException(C)>>installStaticException:category:number: 

  A matching ANSI handler is defined to be one which would return 'true' 
  if the message #handles: was sent to its 'exception selector' 
  with the 'signaled exception' as the argument.

  If a matching handler is found, its handlerBlock is executed.

    For a legacy handler or ANSI default handler, if the handlerBlock 
    returns normally, execution resumes from the point of the signal , 
    with the value returned by the handlerBlock.

    For a handlerBlock installed by on:do: , if the handlerBlock returns normally,
    any ensure: blocks are executed, and execution returns from the send of on:do:
    with the value returned by the handlerBlock .  However if the return from
    the send of on:do: would cross the frame of a C primitive or user action,
    an uncontinuable error is generated.
    Within the handlerBlock, the methods  
      outer, pass , resignalAs:, resume, return ,  
    can be send to this instance of AbstractException  to alter flow . 

  If a matching handler is not found, 'default action' for the receiver 
  is performed, as if #defaultAction were sent to the receiver.
  If the receiver is 'resumable' the value returned from the
  #defaultAction method is returned as the value of the #signal message, 
  otherwise an error is returned to the GCI client. 
 
  If (System gemConfigurationAt:#GemExceptionSignalCapturesStack) == true ,
  and gsStack==nil when primitive 2022 (AbstractException>>_signalWith:) is invoked,
  then primitive 2022 will fill in gsStack with an Array.  
  See AbstractException>>stackReport. "

  ^ self _signalWith: nil

