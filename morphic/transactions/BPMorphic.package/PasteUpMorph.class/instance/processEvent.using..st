events-processing
processEvent: anEvent using: defaultDispatcher
  "Reimplemented to install the receiver as the new ActiveWorld if it is
	one "

  | priorWorld result |
  self isWorldMorph
    ifFalse: [ ^ super processEvent: anEvent using: defaultDispatcher ].
  priorWorld := SessionTemps current at: #'ActiveWorld' ifAbsent: [ nil ].
  SessionTemps current at: #'ActiveWorld' put: self.
  [ result := super processEvent: anEvent using: defaultDispatcher ]
    ensure: [ SessionTemps current at: #'ActiveWorld' put: priorWorld ].
  ^ result