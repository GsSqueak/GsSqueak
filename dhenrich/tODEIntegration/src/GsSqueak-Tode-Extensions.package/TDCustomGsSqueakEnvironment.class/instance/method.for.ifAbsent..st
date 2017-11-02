methods
method: selector for: aBehavior ifAbsent: absentBlock
  ^ (aBehavior
    compiledMethodAt: selector
    environmentId: self methodCompilationEnvironmentId
    otherwise: nil) ifNil: [ absentBlock value ]