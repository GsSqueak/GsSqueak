exceptions
_removeEnsure
  "The sender's frame is changed from  ensure:[] to  ensure: nil .
 Returns nil or an ensure block that has not been started."

  <primitive: 1004>
  self _primitiveFailed: #'_removeEnsureAtFP:'
