signaling
_executeHandler: aBlock

  "Execute aBlock , which was the second arg of an #on:do: ,
   to handle the receiver.  Sent from VM C code only .
   aBlock must be a block taking zero or one arguments." 
  <primitive: 2025> "mark frame with executeHandler_Mark_NIL, always fails"
  | res |
  self _debugException: nil .
  res := aBlock argumentCount == 0 
           ifTrue:[ aBlock value  ] 
           ifFalse:[ aBlock value: self ].

  "If we get here, then handler block did not send a #resume,
   so continue program execution by returning from the #on:do: send
   which installed the handlerBlock we just executed."

  self return: res .  

