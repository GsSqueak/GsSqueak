text-anchor
changeParagraphAnchor
  "Change the anchor from/to paragraph anchoring"

  | newType |
  newType := self textAnchorType == #'paragraph'
    ifTrue: [ #'document' ]
    ifFalse: [ #'paragraph' ].
  self owner isTextMorph
    ifTrue: [ self owner anchorMorph: self at: self position type: newType ]