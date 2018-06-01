as yet unclassified
displayUnder: anOtherMorph
  | text |
  anOtherMorph
    ifNil: [ self position: 100 @ 100 ]
    ifNotNil: [ 
      self top: anOtherMorph bottom.
      self left: anOtherMorph left ].
  self color: Color random.
  text := StringMorph new.
  label ifNil: [ label := '' ].
  text label: label + ' ' + self count asString font: BPFont defaultInstance.
  text top: self top.
  text left: self left.
  self addMorph: text.
  self width: 500 * (self count / parent max).
  self height: 30.
  self openInWorld