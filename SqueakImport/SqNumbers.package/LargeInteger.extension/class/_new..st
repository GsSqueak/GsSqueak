*SqNumbers
_new: length
  "Returns a instance of LargeInteger with specified size and value = 0"

  <primitive: 266>
  length _validateClass: SmallInteger.
  length _error: #'rtErrArgOutOfRange'
