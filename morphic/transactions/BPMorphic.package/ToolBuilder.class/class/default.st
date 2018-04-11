accessing
default
  "Answer the default tool builder"

  BPDefaultInst ifNil: [ BPDefaultInst := MorphicToolBuilder new ].
  ^ BPDefaultInst