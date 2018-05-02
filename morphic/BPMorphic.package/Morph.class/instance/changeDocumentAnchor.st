text-anchor
changeDocumentAnchor
  "Change the anchor from/to document anchoring"

  | newType |
  newType := self textAnchorType == #'document'
    ifTrue: [ #'paragraph' ]
    ifFalse: [ #'document' ].
  self owner isTextMorph
    ifTrue: [ self owner anchorMorph: self at: self position type: newType ]