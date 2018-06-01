as yet unclassified
getEvents: aWindow into: anArray
  | cArray |
  cArray := CByteArray gcMalloc: 8 * 4.
  getEventsCo
    callWith:
      {aWindow.
      cArray}.
  1 to: 8 do: [ :each | anArray at: each put: (cArray uint32At: (each - 1) * 4) ]