Error Handling
doesNotUnderstand: aMessageDescriptor
  "The method is for compatiblity with Gs64 v2.x, and assumes you are using 
   only method environment 0  for all of your Smalltalk code."

  | ex sel args |
  (ex := MessageNotUnderstood _basicNew)
    receiver: self
    selector: (sel := aMessageDescriptor at: 1)
    args: (args := aMessageDescriptor at: 2)
    envId: 0.
  ^ ex signal	"fix for #40871"	"Legacy behavior was that you could fall through from an exception handler
without an explicit resume/return. The fix for 40871 will break applications 
that rely on the old behavior."	"If we continue from the error, re-try the send of the message that was
 not understood."	"^ self perform: sel env: 0 withArguments: args "
