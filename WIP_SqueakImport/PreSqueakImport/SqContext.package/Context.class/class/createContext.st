*Context-as yet unclassified
createContext
  | currParent level aFrame framesArr |
  framesArr := {}.
  level := 1.
  [ (aFrame := GsProcess _frameContentsAt: level + 1) ~~ nil ]
    whileTrue: [ 
      framesArr at: level put: aFrame.
      level := level + 1 ].
  currParent := nil.
  (1 to: framesArr size) reversed
    do: [ :index | 
      | currentContext senderContext |
      currentContext := self new
        _frameContents: (framesArr at: index);
        _sender: currParent;
        yourself.
      senderContext := currentContext sender.
      senderContext
        ifNotNil: [ 
          senderContext receiver isBlock
            ifTrue: [ currentContext _closureOrNil: senderContext receiver ] ].
      currParent := currentContext ].
  ^ currParent
