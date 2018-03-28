*MCEnvSwitch
env: envId foreignExtensionCategoriesForClass: aClass
  ^ (aClass categoryNames: envId)
    select: [ :cat | self isForeignClassExtension: cat ]