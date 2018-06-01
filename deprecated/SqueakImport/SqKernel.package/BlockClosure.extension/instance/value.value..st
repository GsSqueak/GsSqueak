*SqKernel-evaluating
value: firstObject value: secondObject
  "Return the value of the receiver evaluated with the two objects as its
 arguments.  If the block expects a different number of arguments, an error is
 generated.

 #value:value: is optimized by the compiler.
 This method is in the image for use by perform: and for
 failure paths from the optimized bytecode "
  self numArgs ~= 2 ifTrue:
	[self numArgsError: 2].
  ^ self
    valueWithArguments:
      {firstObject.
      secondObject}
