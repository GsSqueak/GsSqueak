*SqueakParser
primitiveNumber
  "set IR info corresponding to <primitive: anInt> in the source"

  | mask primNum |
  mask := 16rFFFF0000.
  ^ (primNum := (methInfo bitAnd: mask) bitShift: -16) = 16rFFFF
    ifTrue: [ 0 ]
    ifFalse: [ primNum ]