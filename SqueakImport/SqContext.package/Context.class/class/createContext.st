as yet unclassified
createContext
  | level framesArr aFrame frames previous stack |
  stack := self stackClass new
    process: GsProcess _current;
    yourself.
  framesArr := {}.
  level := 1.
  [ (aFrame := GsProcess _frameContentsAt: level + 1) ~~ nil ]
    whileTrue: [ 
      framesArr at: level put: aFrame.
      level := level + 1 ].
  frames := {}.
  previous := nil.
  1 to: framesArr size do: [ :index | 
    | frame |
    frame := self new
      frameIndex: index;
      frameContents: (framesArr at: index);
      stack: stack;
      yourself.
    frames add: frame.
    previous ifNotNil: [ previous parent: frame ].
    frame next: previous.
    previous := frame ].
  stack frames: frames.
  ^ stack frames first