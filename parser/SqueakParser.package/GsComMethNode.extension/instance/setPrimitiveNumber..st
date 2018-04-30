*SqueakParser
setPrimitiveNumber: anInt
  "set IR info corresponding to <primitive: anInt> in the source"

  | mask newBits |
  mask := 16rFFFF0000.
  (anInt < 0 or: [ anInt > (mask bitShift: -16) ])
    ifTrue: [ ArgumentError signal: 'invalid primitive number' ].
  "anInt > 1079
    ifTrue: [ ArgumentError signal: 'invalid primitive number for this VM' ]."	"System _maxPrimitiveNumber"
  newBits := anInt bitShift: 16.
  methInfo := (methInfo bitAnd: mask bitInvert) bitOr: newBits