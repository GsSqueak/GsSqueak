as yet unclassified
lacyCommit
  commitCtr := commitCtr + 1.
  commitCtr > 100
    ifTrue: [ 
      System commit.
      commitCtr := 0 ]