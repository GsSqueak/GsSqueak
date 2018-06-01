queries
isValid
  "Answer whether the receiver represents a current selector or Comment"

  | aClass |
  (#(#'DoIt' #'DoItIn:') includes: methodSymbol)
    ifTrue: [ ^ false ].
  (aClass := self actualClass) ifNil: [ ^ false ].
  ^ (aClass includesSelector: methodSymbol environmentId: self environmentId)
    or: [ methodSymbol == #'Comment' ]