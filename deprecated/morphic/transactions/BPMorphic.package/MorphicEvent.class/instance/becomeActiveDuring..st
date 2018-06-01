initialize
becomeActiveDuring: aBlock
  "Make the receiver the ActiveEvent during the evaluation of aBlock."

  | _gsSqueakTemp_priorEvent |
  _gsSqueakTemp_priorEvent := SessionTemps current
    at: #'ActiveEvent'
    ifAbsent: [ nil ].
  SessionTemps current at: #'ActiveEvent' put: self.
  ^ aBlock
    ensure: [ 
      "check to support project switching."
      (SessionTemps current at: #'ActiveEvent') == self
        ifTrue: [ SessionTemps current at: #'ActiveEvent' put: _gsSqueakTemp_priorEvent ] ]