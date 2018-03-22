as yet unclassified
keyDown: anEvent
  super keyDown: anEvent.
  text label: command font: BPFont defaultInstance.
  anEvent keyCharacter = $c
    ifTrue: [ 
      Transcript show: 'committing'.
      self position x == self class getCommonState value
        ifFalse: [ self class getCommonState setTo: self position x ].
      Transcript show: System commit.
      self position x: self class getCommonState value ]