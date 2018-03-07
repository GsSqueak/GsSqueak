as yet unclassified
keyDown: anEvent
  handledEvent := false.
  Transcript
    show: 'key down: ' , anEvent keyString , ' | ';
    show: anEvent keyValue;
    show: ' | '.	"debug output"
  anEvent keyValue = 16
    ifTrue: [ 
      Transcript cr.
      handledEvent := true ].	"Skip <shift> key inputs"
  (anEvent buttons = 8 and: anEvent keyValue = 61)
    ifTrue: [ 
      self command: self command , '+'.
      handledEvent := true ].	" Böser Hack, für die Modifier Keys müssen wir uns noch was vernünftiges ausdenken"
  anEvent keyValue = 13
    ifTrue: [ self handleExecution ].
  anEvent keyValue = 8
    ifTrue: [ 
      self command: self command allButLast.
      handledEvent := true ].
  handledEvent
    ifFalse: [ self command: self command , anEvent keyCharacter ].
  Transcript
    show: self command;
    cr