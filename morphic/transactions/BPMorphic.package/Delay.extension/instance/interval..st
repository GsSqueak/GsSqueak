*BPMorphic
interval: millisecondCount
  "initialize the receiver to delay on an interval"
  
  millisecondCount _isSmallInteger ifFalse:[
    millisecondCount _validateClass: SmallInteger.
  ].
  millisecondCount < 0 ifTrue:[
    ^ millisecondCount _error: #rtErrArgNotPositive 
  ].
  interval := millisecondCount .
  signalTime := nil .
  target := nil .
