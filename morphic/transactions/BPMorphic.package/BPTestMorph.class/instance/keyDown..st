as yet unclassified
keyDown: anEvent
  super keyDown: anEvent.
  text label: command font: BPFont defaultInstance.
  anEvent keyCharacter = $n
    ifTrue: [ 
      self position: 0 @ self position y.
      self redraw ].
  anEvent keyCharacter = $c
    ifTrue: [ self commit ].
  anEvent keyCharacter = $a
    ifTrue: [ self abort ].
  anEvent keyCharacter = $e
    ifTrue: [ self die ]