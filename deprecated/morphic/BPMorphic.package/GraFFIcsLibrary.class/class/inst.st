as yet unclassified
inst
  (SessionTemps current at: #'GrafficsInst' ifAbsent: [ nil ])
    ifNil: [ SessionTemps current at: #'GrafficsInst' put: self new ].
  ^ SessionTemps current at: #'GrafficsInst'