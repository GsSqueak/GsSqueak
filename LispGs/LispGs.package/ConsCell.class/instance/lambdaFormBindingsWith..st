evaluating
lambdaFormBindingsWith: aConsCell
  "the receiver being a lambda form,  return the bindings when given aConsCell as arguments"

  ^ (self cdr car ifNil: [ ^ #() ]) bindingsWithArguments: aConsCell