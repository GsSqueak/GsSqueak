*GsSqueak-ProofOfConcept1c-Tode
_status: checkClosureBool
  "Returns a SmallInteger with status information about the receiver
 encoded in the bit whose masks are defined below:

 16r01 isSpecial
     Set if the receiver is an AbstractCharacter, Boolean,
     SmallInteger, or nil.
 16r02 isCommitted
     Set if the receiver existed in GemStone at the time the current
     transaction began.
     if checkClosureBool is true, and session's most recent commit
     failed and is not yet aborted, check the closureList to determine actual 
     committed state of temporary objects in the closure of the commit.
 16r04 isConnected  (obsolete bit, always 0)
 16r08 isWritten
     Set if the receiver has been written since the last
     commit, abort, or begin transaction command was executed.
 16r10 isWritable
     Set if the receiver canBeWritten by the current user.
 16r20 isTranlogged - true isCommitted and tranlogged, or
     not committed and beTranlogged has been sent .
 16r40 beTranlogged has been sent to the object while in-memory.

 16r700 levels  ( > 0 means a 'large object' implemented as a tree of
		smaller objects which are not visible to Smalltalk)"

  <primitive: 39>
  self _primitiveFailed: #'_status:' args: {checkClosureBool}.
  self _uncontinuableError
