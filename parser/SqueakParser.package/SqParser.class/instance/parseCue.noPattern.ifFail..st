public access
parseCue: aCue noPattern: noPattern ifFail: aBlock
  "Answer a MethodNode for the argument, sourceStream, that is the
	root of
	a parse tree. Parsing is done with respect to the CompilationCue to 
	resolve variables. Errors in parsing are reported to the cue's
	requestor; 
	otherwise aBlock is evaluated. The argument noPattern is a Boolean
	that is
	true if the the sourceStream does not contain a method header (i.e.,
	for DoIts)."

  | methNode repeatNeeded myStream s p subSelection |
  myStream := aCue sourceStream.
  [ 
  repeatNeeded := false.
  p := myStream position.
  s := myStream upToEnd.
  myStream position: p.
  self encoder init: aCue notifying: self.
  self init: myStream cue: aCue failBlock: [ ^ aBlock value ].
  subSelection := self interactive
    and: [ cue requestor selectionInterval = (p + 1 to: p + s size) ].
  doitFlag := noPattern.
  failBlock := aBlock.
  [ methNode := self method: noPattern context: cue context ]
    on: false
    do: [ :ex | 
      repeatNeeded := true.
      properties := nil.	"Avoid accumulating pragmas and primitives Number"
      myStream := ex newSource
        ifNil: [ 
          subSelection
            ifTrue: [ 
              ReadStream
                on: cue requestor text string
                from: cue requestor selectionInterval first
                to: cue requestor selectionInterval last ]
            ifFalse: [ ReadStream on: cue requestor text string ] ]
        ifNotNil: [ :src | myStream := src readStream ] ].
  repeatNeeded ]
    whileTrue: [ encoder := self encoder class new ].
  methNode sourceText: s.
  ^ methNode