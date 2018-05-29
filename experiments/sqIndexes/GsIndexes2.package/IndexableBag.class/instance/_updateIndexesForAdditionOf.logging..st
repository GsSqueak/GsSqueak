as yet unclassified
_updateIndexesForAdditionOf: anObject logging: aBoolean
  "anObject is being added to the receiver.  Update any indexes if necessary.
 Returns true if the index objects were modified correctly; otherwise returns
 an Array containing error information."

  <primitive: 2001>
  | doLogging iList hasIndex prot |
  prot := System _protectedMode.
  [ 
  iList := self _indexedPaths.
  hasIndex := false.
  1 to: iList size by: 2 do: [ :j | 
    " first handle modification tracking "
    (iList at: j + 1) > 0
      ifTrue: [ hasIndex := true ]
      ifFalse: [ 
        (iList at: j + 1) == 0
          ifTrue: [ (iList at: j) adding: anObject to: self ] ] ].
  hasIndex
    ifFalse: [ ^ true ].
  System _bypassReadAuth.
  doLogging := iList isCommitted
    and: [ UnorderedCollection _isRcIndexLoggingEnabled ].	" if the indexes are not committed, do not need to log "
  [ ^ self _doUpdateIndexesForAdditionOf: anObject iList: iList logging: aBoolean ]
    onSynchronous: Error
    do: [ :ex | 
      " returns Array containing err info "
      ^ {true.	" indicating indexing objects may have been modified "
      ex} ] ]
    ensure: [ 
      System _exitBypassReadAuth.
      prot _leaveProtectedMode ].
  ^ true