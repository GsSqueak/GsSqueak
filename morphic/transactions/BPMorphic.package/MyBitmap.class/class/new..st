as yet unclassified
new: pixelCount
  | inst |
  inst := self new.
  inst cArray: (CByteArray malloc: pixelCount * 4).
  ^ inst