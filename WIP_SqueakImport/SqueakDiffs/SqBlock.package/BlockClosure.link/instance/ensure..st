*SqBlock-exceptions
ensure: aBlock
  "Evaluate the receiver.  
 Evaluate aBlock after evaluating the receiver,
 or before any return from a block that would return to the sender.
 Returns result of evaluating the receiver.

 aBlock must be a zero-arg instance of ExecBlock, otherwise an
 error is generated. "

  "marks frame with ENSURE_Mark_NIL, always fails"

  <primitive: 2017>
  | result |
  result := self value.	"execute the receiver"
  self _removeEnsure ifNotNil: [ :b | b value	"normal execution of argument" ].
  ^ result
