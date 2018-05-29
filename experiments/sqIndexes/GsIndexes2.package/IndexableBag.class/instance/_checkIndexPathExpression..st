as yet unclassified
_checkIndexPathExpression: aPathString
  "Raises an error if the given path expression (an Array of Strings), is
 not valid; otherwise returns the receiver."

  ^ aPathString asArrayOfPathTerms