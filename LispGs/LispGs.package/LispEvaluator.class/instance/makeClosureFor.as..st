private
makeClosureFor: aConsCell as: aSymbol
  ^ self makeClosureFor: (self lambdaForm: aSymbol withArgsAndBody: aConsCell)