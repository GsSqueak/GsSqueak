*SqKernel-evaluating
value
  "Return the value of the receiver evaluated with no arguments.
 If the block expects any arguments, an error is generated.

 #value is optimized by the compiler.
 This method is in the image for use by perform: and for
 failure paths from the optimized bytecode "

  ^ self valueWithArguments: #()
