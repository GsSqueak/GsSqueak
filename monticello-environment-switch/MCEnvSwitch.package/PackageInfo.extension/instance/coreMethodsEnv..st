*MCEnvSwitch
coreMethodsEnv: envId
  ^ self classesAndMetaClasses
    gather: [ :class | self env: envId coreMethodsForClass: class ]