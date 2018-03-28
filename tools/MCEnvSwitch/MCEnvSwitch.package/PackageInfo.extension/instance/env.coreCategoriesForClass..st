*MCEnvSwitch
env: envId coreCategoriesForClass: aClass
  ^ (aClass categoryNames: envId)
    select: [ :cat | (self isForeignClassExtension: cat) not ]