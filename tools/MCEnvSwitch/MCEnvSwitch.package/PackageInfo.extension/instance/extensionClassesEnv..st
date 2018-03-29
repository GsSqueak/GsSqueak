*MCEnvSwitch
extensionClassesEnv: envId
  ^ self externalClasses
    reject: [ :class | (self env: envId extensionCategoriesForClass: class) isEmpty ]