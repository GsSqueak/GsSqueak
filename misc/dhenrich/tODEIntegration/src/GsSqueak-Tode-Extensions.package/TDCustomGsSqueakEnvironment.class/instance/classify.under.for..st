methods
classify: methodSelector under: aCategory for: aBehavior
  ^ aBehavior
    classify: methodSelector
    under: aCategory
    environmentId: self methodCompilationEnvironmentId