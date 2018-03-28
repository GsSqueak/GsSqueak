*MCEnvSwitch
env: envId extensionMethodsFromClasses: classes
  ^ classes gather: [ :class | self env: envId extensionMethodsForClass: class ]