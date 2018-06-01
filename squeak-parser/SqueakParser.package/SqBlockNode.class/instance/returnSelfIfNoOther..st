accessing
returnSelfIfNoOther: encoder
  statements last == NodeSelf
    ifFalse: [ statements := statements copyWith: (encoder encodeVariable: 'self') ].
  self returns
    ifTrue: [ ^ self ].
  self returnLast