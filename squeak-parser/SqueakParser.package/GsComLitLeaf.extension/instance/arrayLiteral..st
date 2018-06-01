*SqueakParser
arrayLiteral: anArray
  "anArray is a literal such as the Smalltalk literal  #( 1 2 abc )
 which can be constructed without executing any bytecodes. 

 In Smalltalk , these arrays are  Invarant , and the  Parser
 canonicalizes them based on comparing substrings from the source code.
"

  self setIRnodeKind.	"stringForm left as nil for now"
  litKind := COMPAR_ARRAY_LIT.
  litValue := anArray	"anArray immediateInvariant"