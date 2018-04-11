as yet unclassified
_getSessionElementFor: offset
  "Returns the RcCounterElement for the given offset.  If one does not exist,
 then create it."

  | sessionElement |
  sessionElement := self _rcAt: offset.
  sessionElement == nil
    ifTrue: [ 
      sessionElement := RcRecentIntegerElement new.
      sessionElement objectSecurityPolicy: self objectSecurityPolicy.
      self at: offset put: sessionElement.
      System redoLog addConflictObject: self for: self ].
  ^ sessionElement