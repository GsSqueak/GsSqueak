error handling
_primitiveFailed: aSelector
  "Methods which are implemented as primitives send _primitiveFailed:
 when a primitive fails and the failure is not attributable to any
 normal error such as bad argument kind, argument out of range, etc."

  ^ self _primitiveFailed: aSelector args: {}
