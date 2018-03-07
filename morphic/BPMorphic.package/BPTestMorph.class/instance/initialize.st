as yet unclassified
initialize
  super initialize.
  background := NewRect new.
  text := StringMorph new.
  text label: 'Test' font: BPFont defaultInstance.
  self addMorph: text.
  self addMorph: text