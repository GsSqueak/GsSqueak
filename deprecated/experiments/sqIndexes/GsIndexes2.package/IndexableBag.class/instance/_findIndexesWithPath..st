as yet unclassified
_findIndexesWithPath: pathArray
  "Returns an Array of index objects whose path components are the same as
 represented by the path string.  This method only considers those indexes that
 are defined with the receiver as the root NSC."

  | anArray iList |
  iList := self _indexedPaths.
  iList == nil
    ifTrue: [ ^ {} ].
  anArray := {}.	" for each index on the NSC ... "
  1 to: iList size by: 2 do: [ :i | 
    " only look at the index if the receiver is the root "
    (iList at: i + 1) == 1
      ifTrue: [ 
        " if the index is on the same path, add it to the Array "
        ((iList at: i) hasIndexOnPath: pathArray)
          ifTrue: [ anArray addLast: (iList at: i) ] ] ].
  ^ anArray