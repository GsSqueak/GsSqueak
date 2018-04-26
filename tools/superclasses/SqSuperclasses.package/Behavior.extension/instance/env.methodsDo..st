*SqSuperclasses
env: envId methodsDo: aBlock
  | methDict |
  "evaluates aBlock for each method in receiver's method dictionaries
   for specified environment. Returns the receiver.

   aBlock should be a two argument block
   expecting the args  selectorSymbol ,   aGsNMethod ."

  (methDict := (self persistentMethodDictForEnv: envId )) ifNotNil: [methDict keysAndValuesDo: aBlock] 

