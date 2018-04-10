as yet unclassified
new: pixelCount
  | inst |
  inst := self new.
  inst cArray: (ByteArray new: pixelCount * 4).
  ^ inst