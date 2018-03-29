as yet unclassified
setTo: aNumber
  "Increment the current session's counter value by the given amount."

  | sessionElement total systm |
  "  aNumber _validateClass: Number."
  sessionElement := self _getSessionElementFor: self _thisSessionIndex.
  systm := System.
  systm _addRootObjectToRcReadSet: sessionElement.
  sessionElement setTo: aNumber.	" if the counter total has been cached, update the cache "
  (systm rcValueCacheAt: #'value' for: self otherwise: nil) == nil
    ifTrue: [ ^ self ].
  System rcValueCacheAt: #'value' put: aNumber for: self