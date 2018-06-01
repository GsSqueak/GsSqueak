as yet unclassified
lacyCommit
  commitCtr := commitCtr + 1.
  commitCtr > 50000
    ifTrue: [ 
      System commit.
      commitCtr := 0 ]