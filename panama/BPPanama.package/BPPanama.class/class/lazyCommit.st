as yet unclassified
lazyCommit
  commitCtr := self commitCtr + 1.
  commitCtr > 10000
    ifTrue: [ 
      System commit.
      commitCtr := 0 ]