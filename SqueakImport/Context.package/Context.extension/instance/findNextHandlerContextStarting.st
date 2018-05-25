*Context-as yet unclassified
findNextHandlerContextStarting
  "Return the next handler marked context, returning nil if there is none.  Search starts with self and proceeds up to nil."

  | ctx |
  ctx := self.
  [ 
  ctx isHandlerContext
    ifTrue: [ ^ ctx ].
  (ctx := ctx sender) == nil ]
    whileFalse.
  ^ nil
