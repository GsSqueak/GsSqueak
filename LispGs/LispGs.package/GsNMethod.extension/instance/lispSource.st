*LispGs
lispSource
  ^ LispEvaluator current environment
    symbolValue: self selector allButLast asSymbol
    ifNone: [ nil ]