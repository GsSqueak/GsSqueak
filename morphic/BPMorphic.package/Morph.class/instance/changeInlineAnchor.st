text-anchor
changeInlineAnchor
  "Change the anchor from/to line anchoring"

  | newType |
  newType := self textAnchorType == #'inline'
    ifTrue: [ #'paragraph' ]
    ifFalse: [ #'inline' ].
  self owner isTextMorph
    ifTrue: [ self owner anchorMorph: self at: self position type: newType ]