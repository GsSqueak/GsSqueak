as yet unclassified
screenSize
  | cArray |
  cArray := CByteArray gcMalloc: 8.
  getSizeCo
    callWith:
      {(self defaultWindow).
      cArray}.
  ^ (cArray uint32At: 0) @ (cArray uint32At: 4)