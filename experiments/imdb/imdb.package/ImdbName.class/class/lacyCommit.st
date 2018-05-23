as yet unclassified
lacyCommit
  commitCtr := commitCtr + 1.
  commitCtr > 5000
    ifTrue: [ 
      System commit.
      commitCtr := 0 ]