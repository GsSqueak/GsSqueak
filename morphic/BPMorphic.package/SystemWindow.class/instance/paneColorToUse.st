colors
paneColorToUse
  ^ self paneColor	"(Smalltalk at: #'Display') depth <= 2
    ifTrue: [ Color white ]
    ifFalse: ["	"]"