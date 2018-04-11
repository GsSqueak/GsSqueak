menus
adhereToEdge: edgeSymbol
  | edgeMessage |
  (self owner isNil or: [ self owner isHandMorph ])
    ifTrue: [ ^ self ].
  (self owner class canUnderstand: edgeSymbol)
    ifFalse: [ ^ self ].
  (self class canUnderstand: (edgeMessage := (edgeSymbol , ':') asSymbol))
    ifFalse: [ ^ self ].
  self
    perform: edgeMessage
    withArguments: (Array with: (self owner perform: edgeSymbol))