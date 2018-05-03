*SqueakParser
scaledDecimalLiteral: aScaledLiteral
  self setIRnodeKind.	"stringForm left as nil for now"
  litKind := COMPAR_SCALED_DEC_LIT.
  litValue := aScaledLiteral	"do not set invariant"