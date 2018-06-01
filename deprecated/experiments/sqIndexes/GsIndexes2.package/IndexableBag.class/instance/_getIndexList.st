
_getIndexList
  "Returns the index list for the receiver.  If one does not exist, create it."

  | iList |
  iList := self _indexedPaths.
  iList == nil
    ifTrue: [ 
      iList := IndexList new.
      self _indexedPaths: iList.	"deleted moveToDisk"
      iList objectSecurityPolicy: GsIndexingObjectSecurityPolicy ].
  ^ iList