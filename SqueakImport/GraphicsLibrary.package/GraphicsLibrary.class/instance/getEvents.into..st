as yet unclassified
getEvents: aWindow into: anArray
  | cArray cArrayClass |
  cArrayClass := GemstoneSmalltalk _env0 classNamed: #CByteArray.
  cArray := cArrayClass _env0 gcMalloc: 8 * 4.
  getEventsCo
    _env0 callWith:
      {aWindow.
      cArray}.
  1 to: 8 do: [ :each | anArray at: each put: (cArray _env0 uint32At: (each - 1) * 4) ]
