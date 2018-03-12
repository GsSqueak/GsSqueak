as yet unclassified
keyDown: anEvent
  handledEvent := false.
  Transcript
    show: anEvent buttons;
    cr.
  Transcript
    show: 'key down: ' , anEvent keyString , ' | ';
    show: anEvent keyValue;
    show: ' | '.	"debug output"
  anEvent keyValue = 16
    ifTrue: [ 
      Transcript cr.
      handledEvent := true ].	"Skip <shift> key inputs"
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