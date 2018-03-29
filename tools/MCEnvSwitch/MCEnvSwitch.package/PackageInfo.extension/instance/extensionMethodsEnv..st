*MCEnvSwitch
extensionMethodsEnv: envId
  ^ self externalClasses
    gather: [ :class | self env: envId extensionMethodsForClass: class ]