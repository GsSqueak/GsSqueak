as yet unclassified
keyDown: anEvent
  super keyDown: anEvent.
  text label: command font: BPFont defaultInstance.
  anEvent keyCharacter = $n
    ifTrue: [ 
      self position: 0 @ self position y.
      self redraw ].
  anEvent keyCharacter = $c
    ifTrue: [ 
      Transcript show: 'committing'.
      self position x == self class getCommonState value
        ifFalse: [ self class getCommonState setTo: self position x ].
      Transcript show: System commit.
      self position: self class getCommonState value @ self position y.
      self redraw ].
  anEvent keyCharacter = $a
    ifTrue: [ 
      Transcript show: 'aborting'.
      System abort.
      self position: self class getCommonState value @ self position y.
      self redraw ].
  anEvent keyCharacter = $e
    ifTrue: [ wantsToLive := false ]