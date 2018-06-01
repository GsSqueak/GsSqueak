*SqueakParser
byteArrayLiteral: anByteArray
  self setIRnodeKind.
  litKind := 12.
  litValue := anByteArray	"anByteArray immediateInvariant"