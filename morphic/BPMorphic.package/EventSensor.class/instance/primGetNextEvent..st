private-I/O
primGetNextEvent: array
  | cArray |
  cArray := CByteArray malloc: 8 * 4.
  GraFFIcsLibrary getEventsCo callWith: {cArray}.
  1 to: 8 do: [ :each | array at: each put: (cArray uint32At: (each - 1) * 4) ]