public access
parse: sourceStream class: class noPattern: noPattern notifying: req ifFail: aBlock
  | c |
  c := SqCompilationCue
    source: sourceStream
    class: class
    environment: (Smalltalk at: #'SqueakEnvironment')
    requestor: req.
  ^ self parseCue: c noPattern: noPattern ifFail: aBlock
