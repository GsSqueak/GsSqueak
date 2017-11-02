*GsSqueak-ProofOfConcept1c-Tode
isCommitted
  "Returns true if the receiver was a committed object at the time the current
 transaction began.  Returns false otherwise."

  ^ ((self _status: true) bitAnd: 2) ~~ 0
