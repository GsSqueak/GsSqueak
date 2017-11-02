methods
moveMethod: methodSelector toCategory: aCategory for: aBehavior
  ^ aBehavior
    moveMethod: methodSelector
    toCategory: aCategory
    environmentId: self methodCompilationEnvironmentId