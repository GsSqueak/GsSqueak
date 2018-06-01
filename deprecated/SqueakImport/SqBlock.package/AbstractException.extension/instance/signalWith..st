*SqBlock-signaling
_signalWith: inCextensionArg
  <primitive: 2022>

   "The current stack is searched for an 'exception handler' per
    AbstractException>>signal .
    If a handler found, new frame pushed 
      to execute  _executeHandler:   or   _executeGsHandler:  .
      and the primitive does not return.
    If exception handling succeeds and execution is to resume, 
    either the resume: or the return: primitive will do the 'goto'
    and we don't actually return from this frame .

    inCextensionArg must be nil at entry, and may be modified
    by primitive.

    If a Smalltalk handler not found, 
    primitive fails so we can defer to a C extension or send defaultAction here."
 
  | res |
  inCextensionArg ifNotNil:[
    "primitive found a C extension which wants to handle receiver."
    self _executeEnsuresBelow: 1 .  "execute ensures from TOS to C extension"
    self _handleInCextension.  "trims stack and returns to C extension"
  ].
  res := self defaultAction .  
    "if you change code from beginning of method to here , may need to
     alter C code at  IntSwiReplaceTos_IPOFFSET"

  1 timesRepeat:[ self class ]. "loop to detect/handle termination interrupt"
  self isResumable ifTrue:[
    ^ res .
  ].
  self _signalGciError .
  self _uncontinuableError . "should never reach here"

