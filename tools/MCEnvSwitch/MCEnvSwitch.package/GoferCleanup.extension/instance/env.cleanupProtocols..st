*MCEnvSwitch
env: envId cleanupProtocols: aWorkingCopy
  aWorkingCopy packageInfo extensionClasses
    do: [ :class | 
      (aWorkingCopy packageInfo env: envId extensionCategoriesForClass: class)
        do: [ :category | 
          (class organization listAtCategoryNamed: category) isEmpty
            ifTrue: [ class organization removeCategory: category environmentId: envId ] ] ].
  aWorkingCopy packageInfo classesAndMetaClasses
    do: [ :class | 
      (aWorkingCopy packageInfo env: envId coreCategoriesForClass: class)
        do: [ :category | 
          (class organization listAtCategoryNamed: category) isEmpty
            ifTrue: [ class organization removeCategory: category environmentId: envId ] ] ]