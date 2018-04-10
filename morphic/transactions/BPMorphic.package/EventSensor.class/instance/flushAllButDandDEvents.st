accessing
flushAllButDandDEvents
  | _gsSqueakTemp_newQueue _gsSqueakTemp_oldQueue |
  _gsSqueakTemp_newQueue := TransientSharedQueue new.
  self eventQueue
    ifNil: [ 
      self eventQueue: _gsSqueakTemp_newQueue.
      ^ self ].
  _gsSqueakTemp_oldQueue := self eventQueue.
  [ _gsSqueakTemp_oldQueue size > 0 ]
    whileTrue: [ 
      | item type |
      item := _gsSqueakTemp_oldQueue next.
      type := item at: 1.
      type = EventTypeDragDropFiles
        ifTrue: [ _gsSqueakTemp_newQueue nextPut: item ] ].
  self eventQueue: _gsSqueakTemp_newQueue