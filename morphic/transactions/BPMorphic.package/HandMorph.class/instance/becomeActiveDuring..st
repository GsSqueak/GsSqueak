initialization
becomeActiveDuring: aBlock
  "Make the receiver the ActiveHand during the evaluation of aBlock."

  | _gsSqueakTemp_priorHand |
  _gsSqueakTemp_priorHand := SessionTemps current at: #'ActiveHand'.
  SessionTemps current at: #'ActiveHand' put: self.
  ^ aBlock
    ensure: [ 
      "check to support project switching."
      (SessionTemps current at: #'ActiveHand') == self
        ifTrue: [ SessionTemps current at: #'ActiveHand' put: _gsSqueakTemp_priorHand ] ]
