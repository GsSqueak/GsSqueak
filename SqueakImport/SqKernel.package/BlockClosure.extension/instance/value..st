*SqKernel-evaluating
value: anObject
  "Return the value of the receiver evaluated with anObject as its argument.  If
 the block expects a different number of arguments, an error is generated.

 #value: is optimized by the compiler.
 This method is in the image for use by perform: and for
 failure paths from the optimized bytecode "

  ^ self valueWithArguments: {anObject}
