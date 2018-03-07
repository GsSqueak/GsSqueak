as yet unclassified
handleExecution
  Transcript
    cr;
    show: self evaluateCommand;
    cr.
  self command: self command , '-->' , self evaluateCommand asString.
  handledEvent := true.
  ^ self