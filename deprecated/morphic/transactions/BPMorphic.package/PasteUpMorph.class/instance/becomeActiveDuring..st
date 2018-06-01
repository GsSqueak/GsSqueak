initialization
becomeActiveDuring: aBlock
  "Make the receiver the ActiveWorld during the evaluation of aBlock."

  | priorWorld |
  priorWorld := SessionTemps current at: #'ActiveWorld' ifAbsent: [ nil ].
  SessionTemps current at: #'ActiveWorld' put: self.
  ^ aBlock
    ensure: [ 
      "check to support project switching."
      (SessionTemps current at: #'ActiveWorld') == self
        ifTrue: [ SessionTemps current at: #'ActiveWorld' put: priorWorld ] ]