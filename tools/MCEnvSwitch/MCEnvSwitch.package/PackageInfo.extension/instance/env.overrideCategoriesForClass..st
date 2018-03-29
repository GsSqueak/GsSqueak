*MCEnvSwitch
env: envId overrideCategoriesForClass: aClass
  ^ (aClass categoryNames: envId)
    select: [ :cat | self isOverrideCategory: cat ]