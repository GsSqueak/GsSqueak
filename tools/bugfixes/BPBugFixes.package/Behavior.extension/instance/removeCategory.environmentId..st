*BPBugFixes
removeCategory: categoryName environmentId: envId
  "Removes the specified category and all its methods from the receiver's
 method dictionary.  If categoryName is not in the receiver's categories,
 generates an error.
 Any breakpoints in removed methods are cleared."

  | theSelectors catSym allCats |
  self _validatePrivilege
    ifFalse: [ ^ nil ].
  (self includesCategory: categoryName environmentId: envId)
    ifFalse: [ ^ self _categoryNotFound: categoryName ].
  catSym := categoryName asSymbol.
  allCats := self _unifiedCategorys: envId.
  theSelectors := (allCats at: catSym) copy.
  1 to: theSelectors size do: [ :j | 
    envId == 0
      ifTrue: [ self _basicRemoveSelector: (theSelectors at: j) environmentId: envId ]
      ifFalse: [ self __basicRemoveSelector: (theSelectors at: j) environmentId: envId ] ].
  envId == 0
    ifTrue: [ 
      | policy |
      policy := GsPackagePolicy currentOrNil.
      policy ifNotNil: [ :pp | pp removeCategory: catSym for: self ].
      (self canBeWritten or: [ policy == nil ])
        ifTrue: [ (self _baseCategorys: envId) removeKey: catSym otherwise: nil ] ]
    ifFalse: [ (self _baseCategorys: envId) removeKey: catSym ].
  self _announceReorganized