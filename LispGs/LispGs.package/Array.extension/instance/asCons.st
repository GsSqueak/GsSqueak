*LispGs
asCons
  | cons |
  self size = 0
    ifTrue: [ ^ nil ].
  self size = 1
    ifTrue: [ ^ ConsCell car: (self at: 1) asCons ].
  self reverseDo: [ :elt | cons := ConsCell car: elt asCons cdr: cons ].
  ^ cons