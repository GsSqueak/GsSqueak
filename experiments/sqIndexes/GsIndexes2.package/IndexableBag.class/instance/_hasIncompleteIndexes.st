as yet unclassified
_hasIncompleteIndexes
  "Returns whether the receiver has any incomplete indexes on it.
 If the receiver has incomplete indexes use IndexManager>>removeAllIncompleteIndexesOn:
 to remove the incomplete indexes."

  | iList |
  iList := self _indexedPaths.
  iList == nil
    ifTrue: [ ^ false ].
  1 to: iList size by: 2 do: [ :i | 
    " if it is an incomplete root index ... "
    ((iList at: i + 1) == 1 and: [ (iList at: i) isComplete not ])
      ifTrue: [ ^ true ] ].
  ^ false