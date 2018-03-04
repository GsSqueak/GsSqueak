as yet unclassified
keyDown: anEvent
  Transcript
    show: 'key down: ' , anEvent keyString , ' | ';
    show: anEvent keyValue;
    show: ' | '.	"debug output"
  anEvent keyValue = 16
    ifTrue: [ 
      Transcript cr.
      ^ self ].	"Skip <shift> key inputs"
  (anEvent buttons = 8 and: anEvent keyValue = 61)
    ifTrue: [ 
      self command: self command , '+'.
      Transcript
        show: self command;
        cr.
      ^ self ].	" Böser Hack, für die Modifier Keys müssen wir uns noch was vernünftiges ausdenken"
  anEvent keyValue = 13
    ifTrue: [ 
      Transcript
        cr;
        show: (TDTopezServer batchInstance evaluateString: self command);
        cr.	"Evaluate command on <return>"
      self command: '' ]
    ifFalse: [ 
      self command: self command , anEvent keyCharacter.
      Transcript
        show: self command;
        cr ]