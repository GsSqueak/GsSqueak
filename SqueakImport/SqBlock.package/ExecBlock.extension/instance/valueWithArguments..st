*SqBlock-evaluating
valueWithArguments: argList
  "Return the value of the receiver evaluated with the elements of the Array
 argList as arguments.  If the block expects a different number of arguments,
 an error is generated."

  "compiler emits special bytecode"

  <primitive: 2003>
  ^ self _primitiveFailed: #'valueWithArguments:' args: {argList}
