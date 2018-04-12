accessing
sourceOffset: anInt
  sourceOffset := anInt > 0
    ifTrue: [ anInt ]
    ifFalse: [ 0 ]