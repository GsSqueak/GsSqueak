*MCEnvSwitch
methodsEnv: envId
  ^ (self extensionMethodsEnv: envId) , (self coreMethodsEnv: envId)
    select: [ :method | 
      method isValid
        and: [ (#(#'DoIt' #'DoItIn:') includes: method methodSymbol) not ] ]