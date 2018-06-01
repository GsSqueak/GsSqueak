as yet unclassified
handleExecution
  Transcript
    cr;
    show: self evaluateCommand;
    cr.
  self command: ''.
  handledEvent := true.
  ^ self