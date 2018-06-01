*BPMorphic
emit
  "Calling this from a method makes the method to a signal."

  | signalCtx signal args |
  ^ self	"signalCtx := thisContext sender.
  signal := signalCtx method.	"	"Do not allow external emitting of signals. Support for method wrappers."	"
  self flag: #'performance'.	"	"mt: #isKindOf: expensive here?"	"
  ((signalCtx sender sender receiver
    isKindOf: (Smalltalk at: #'MwMethodWrapper' ifAbsent: [ nil ]))
    ifTrue: [ signalCtx sender sender sender sender sender sender receiver ]
    ifFalse: [ 
      signalCtx sender receiver class
        == (Smalltalk at: #'TestCoverage' ifAbsent: [ nil ])
        ifTrue: [ signalCtx sender sender receiver ]
        ifFalse: [ signalCtx sender receiver ] ])
    == signalCtx receiver
    ifFalse: [ Error signal: 'Must not emit an object''s signal from the outside!' ].	"	"Extract arguments."	"
  args := Array new: signal numArgs.
  (1 to: signal numArgs)
    do: [ :index | args at: index put: (signalCtx tempAt: index) ].
  self emitSignal: signal selector arguments: args sender: self"