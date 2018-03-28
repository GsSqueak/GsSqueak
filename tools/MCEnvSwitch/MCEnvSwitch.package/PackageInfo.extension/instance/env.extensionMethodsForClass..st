*MCEnvSwitch
env: envId extensionMethodsForClass: aClass
  ^ (self env: envId extensionCategoriesForClass: aClass)
    gather: [ :cat | self env: envId methodsInCategory: cat ofClass: aClass ]