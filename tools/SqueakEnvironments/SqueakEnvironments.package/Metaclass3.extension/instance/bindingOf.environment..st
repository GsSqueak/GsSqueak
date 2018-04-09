*SqueakEnvironments
bindingOf: varName environment: anEnvironment
  "Answer the binding of some variable resolved in the scope of the receiver"

  | aSymbol binding |
  aSymbol := varName asSymbol.	"First look in local classVar dictionary."
  binding := self classPool bindingOf: aSymbol.
  binding ifNotNil: [ ^ binding ].	"Next look in local shared pools."
  self sharedPools
    do: [ :pool | 
      binding := pool bindingOf: aSymbol.
      binding ifNotNil: [ ^ binding ] ].	"Next look into superclass pools"
  superClass
    ifNotNil: [ ^ superClass bindingOf: aSymbol environment: anEnvironment ].	"No more superclass... Last look in declared environment."
  ^ anEnvironment bindingOf: aSymbol