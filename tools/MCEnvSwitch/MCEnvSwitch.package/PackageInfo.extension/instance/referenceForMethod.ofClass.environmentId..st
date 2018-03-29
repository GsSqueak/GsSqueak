*MCEnvSwitch
referenceForMethod: aSymbol ofClass: aClass environmentId: envId
  ^ EnvMethodReference new
    setStandardClass: aClass
    methodSymbol: aSymbol
    environmentId: envId