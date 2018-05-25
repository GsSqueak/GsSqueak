evaluating
value: first value: second value: third value: fourth
  "Return the value of the receiver evaluated with the four objects as
 its arguments.  If the block expects a different number of arguments,
 an error is generated.

 #value:value:value:value: is optimized by the compiler.
 This method is in the image for use by perform: and for
 failure paths from the optimized bytecode "
  self numArgs ~= 4 ifTrue:
	[self numArgsError: 4].
  ^ self
    valueWithArguments:
      {first.
      second.
      third.
      fourth}
