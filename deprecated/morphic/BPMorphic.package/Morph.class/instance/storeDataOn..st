objects from disk
storeDataOn: aDataStream
  "Let all Morphs be written out. All owners are weak references. They
	only go out if the owner is in the tree being written."

  "block my owner unless he is written out by someone else"

  | cntInstVars cntIndexedVars ti localInstVars |
  cntInstVars := self class instSize.
  cntIndexedVars := self basicSize.
  localInstVars := Morph instVarNames.
  ti := 2.
  (localInstVars at: ti) = 'owner' & (Morph superclass == Object)
    ifFalse: [ self error: 'this method is out of date' ].
  aDataStream beginInstance: self class size: cntInstVars + cntIndexedVars.
  1 to: ti - 1 do: [ :i | aDataStream nextPut: (self instVarAt: i) ].
  aDataStream nextPutWeak: self owner.	"owner only written if in our tree"
  ti + 1 to: cntInstVars do: [ :i | aDataStream nextPut: (self instVarAt: i) ].
  1 to: cntIndexedVars do: [ :i | aDataStream nextPut: (self basicAt: i) ]