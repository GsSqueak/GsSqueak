as yet unclassified
getEvents: aBPWindow into: anArray
  | cArray |
  cArray := CByteArray gcMalloc: 8 * 4.
  GetEventsCo
    callWith:
      {(aBPWindow cPointer).
      cArray}.
  1 to: 8 do: [ :each | anArray at: each put: (cArray uint32At: (each - 1) * 4) ]