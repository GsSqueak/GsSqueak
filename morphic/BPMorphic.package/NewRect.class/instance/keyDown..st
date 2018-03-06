as yet unclassified
keyDown: anEvent
  | handled |
  handled := false.
  Transcript
    show: 'key down: ' , anEvent keyString , ' | ';
    show: anEvent keyValue;
    show: ' | '.	"debug output"
  anEvent keyValue = 16
    ifTrue: [ 
      Transcript cr.
      handled := true ].	"Skip <shift> key inputs"
  (anEvent buttons = 8 and: anEvent keyValue = 61)
    ifTrue: [ 
      self command: self command , '+'.
      handled := true ].	" Böser Hack, für die Modifier Keys müssen wir uns noch was vernünftiges ausdenken"
  anEvent keyValue = 13
    ifTrue: [ 
      Transcript
        cr;
        show:
            (TDTopezServer batchInstance evaluateString: self command inContext: self);
        cr.
      handled := true.	"Evaluate command on <return>"
      self command: ''.
      ^ self ].
  anEvent keyValue = 8
    ifTrue: [ 
      self command: self command allButLast.
      handled := true ].
  handled
    ifFalse: [ self command: self command , anEvent keyCharacter ].
  Transcript
    show: self command;
    cr