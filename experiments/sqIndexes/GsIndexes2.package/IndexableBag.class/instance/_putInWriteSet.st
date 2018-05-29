as yet unclassified
_putInWriteSet
  "In some cases, it is necessary to put an NSC with indexes into the write set
 explicitly.  For example, when NO_RW_CHECKS concurrency mode is enabled, index
 creation should put the NSC in the write set to ensure that other transactions
 do not commit additions to the NSC successfully (and thus corrupting the
 internal indexing objects).  This method puts the receiver in the write set by
 writing the _indexedPaths."

  self _indexedPaths: self _indexedPaths