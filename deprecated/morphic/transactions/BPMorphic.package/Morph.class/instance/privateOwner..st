private
privateOwner: aMorph
  "Private! Should only be used by methods that maintain the
	ower/submorph invariant."

  (aMorph isNil not and: [ aMorph isWorldMorph ])
    ifTrue: [ 
      owner2 = 'world'
        ifFalse: [ owner2 := 'world' ] ]
    ifFalse: [ owner2 := aMorph ]