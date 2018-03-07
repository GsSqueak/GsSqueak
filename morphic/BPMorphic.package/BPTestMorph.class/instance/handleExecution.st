as yet unclassified
handleExecution
  self command: self command , '-->' , self evaluateCommand asString.
  handledEvent := true.
  Transcript
    cr;
    show: self command;
    cr.
  ^ self