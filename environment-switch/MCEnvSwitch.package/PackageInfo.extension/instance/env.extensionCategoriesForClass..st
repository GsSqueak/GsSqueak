*MCEnvSwitch
env: envId extensionCategoriesForClass: aClass
  ^ (aClass categoryNames: envId)
    select: [ :cat | self isYourClassExtension: cat ]