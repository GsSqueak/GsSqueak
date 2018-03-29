*MCEnvSwitch
env: envId foreignExtensionMethodsForClass: aClass
  ^ (self env: envId foreignExtensionCategoriesForClass: aClass)
    gather: [ :cat | 
      (aClass selectorsIn: cat environmentId: envId)
        collect: [ :sel | self referenceForMethod: sel ofClass: aClass environmentId: envId ] ]