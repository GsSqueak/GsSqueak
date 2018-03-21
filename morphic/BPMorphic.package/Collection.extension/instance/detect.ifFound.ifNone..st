*BPMorphic
detect: aBlock ifFound: foundBlock ifNone: exceptionBlock
  "foundBlock takes one argument, the found object."

  self
    do: [ :element | 
      (aBlock value: element)
        ifTrue: [ ^ foundBlock value: element ] ].
  ^ exceptionBlock value